export async function onRequest(context) {
  const url = new URL(context.request.url);

  // 如果直接访问 /proxy，给个提示
  if (url.pathname === "/proxy" || url.pathname === "/proxy/") {
    return new Response("Ezexam Proxy is running!", { status: 200 });
  }

  // 将 /proxy/ 后面的路径拼接到 GitHub
  // 比如请求 /proxy/raw/main/typst.toml 会变成 https://github.com/gbchu/ezexam/raw/main/typst.toml
  const targetPath = url.pathname.replace("/proxy", "");
  const targetUrl = "https://github.com/gbchu/ezexam" + targetPath + url.search;

  // 转发请求，并跟随重定向
  return fetch(targetUrl, {
    method: context.request.method,
    headers: context.request.headers,
    body: context.request.body,
    redirect: "follow"
  });
}