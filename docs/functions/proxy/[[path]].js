export async function onRequest(context) {
  const url = new URL(context.request.url);
  const targetPath = url.pathname.replace(/^\/proxy/, "");

  // 根路径直接代理 GitHub 的 main.zip
  if (targetPath === "" || targetPath === "/") {
    const zipUrl = "https://github.com/gbchu/ezexam/archive/refs/heads/main.zip";
    const response = await fetch(zipUrl, { redirect: "follow" });

    // 直接把 GitHub 的响应流传给用户，并覆盖 Header
    return new Response(response.body, {
      status: response.status,
      headers: {
        "Content-Type": "application/zip",
        "Content-Disposition": "attachment; filename=ezexam.zip",
        "Access-Control-Allow-Origin": "*"
      }
    });
  }

  // 代理具体的文件（比如获取 typst.toml）
  const targetUrl = "https://github.com/gbchu/ezexam" + targetPath + url.search;
  const response = await fetch(targetUrl, {
    headers: { "User-Agent": "Mozilla/5.0" },
    redirect: "follow"
  });

  const newHeaders = new Headers(response.headers);
  newHeaders.set("Access-Control-Allow-Origin", "*");

  // 返回文件流
  return new Response(response.body, { status: response.status, headers: newHeaders });
}