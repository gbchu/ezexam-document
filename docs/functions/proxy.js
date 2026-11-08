export async function onRequest(context) {
  const url = new URL(context.request.url);

  // 根路径测试
  if (url.pathname === "/proxy" || url.pathname === "/proxy/") {
    return new Response("Ezexam 代理已运行！", { status: 200 });
  }

  // 拼接目标路径
  const targetPath = url.pathname.replace("/proxy", "");
  const targetUrl = "https://github.com/gbchu/ezexam" + targetPath + url.search;

  try {
    // 设置一个 10 秒的超时机制，防止一直卡死
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), 10000);

    const response = await fetch(targetUrl, {
      method: context.request.method,
      headers: context.request.headers,
      redirect: "follow",
      signal: controller.signal,
    });

    clearTimeout(timeoutId);

    // 返回 GitHub 的响应，并加上允许跨域的 Header（对 git clone 很重要）
    const newHeaders = new Headers(response.headers);
    newHeaders.set("Access-Control-Allow-Origin", "*");

    return new Response(response.body, {
      status: response.status,
      statusText: response.statusText,
      headers: newHeaders,
    });
  } catch (error) {
    // 如果超时或出错，把错误信息直接打印在浏览器里，别转圈
    return new Response("代理请求失败: " + error.message, {
      status: 502,
      headers: { "content-type": "text/plain; charset=utf-8" },
    });
  }
}
