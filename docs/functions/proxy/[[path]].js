export async function onRequest(context) {
  const url = new URL(context.request.url);
  // 去掉 /proxy 前缀，拼接到 GitHub
  const targetPath = url.pathname.replace(/^\/proxy/, "");
  const targetUrl = "https://github.com/gbchu/ezexam" + targetPath + url.search;

  try {
    const response = await fetch(targetUrl, {
      method: context.request.method,
      headers: { "User-Agent": "Mozilla/5.0", Accept: "*/*" },
      redirect: "follow",
    });

    const newHeaders = new Headers(response.headers);
    newHeaders.set("Access-Control-Allow-Origin", "*");

    return new Response(response.body, {
      status: response.status,
      statusText: response.statusText,
      headers: newHeaders,
    });
  } catch (error) {
    return new Response("Proxy Error: " + error.message, { status: 502 });
  }
}
