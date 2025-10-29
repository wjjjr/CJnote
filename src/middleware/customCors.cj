package CJnote.middleware

import cjoy.{JoyMiddlewareHandler, JoyRequestHandlerChain, JoyContext, JoyHttpConsts}
import cjoy.log.LogTool

public class CustomCors <: JoyMiddlewareHandler {
    public func handle(ctx: JoyContext, chain: JoyRequestHandlerChain): Unit {
        // 获取Origin头部
        print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        let origin = ctx.getHeader(JoyHttpConsts.HEADER_ORIGIN)
        
        //处理预检请求
        print("!!!!!!!!!!${ctx.method}!!!!!${ ctx.getHeader(JoyHttpConsts.HEADER_ACCESS_CONTROL_REQUEST_METHOD).isSome()}!!!!!!!!!!${origin.isSome()}!!!!!!!!!!!!!!!!")
        if (ctx.method == JoyHttpConsts.METHOD_OPTIONS &&
            ctx.getHeader(JoyHttpConsts.HEADER_ACCESS_CONTROL_REQUEST_METHOD).isSome() && 
            origin.isSome()) {
              print("77777777777777777777777777777777777777777777777777777")
            LogTool.info("[CustomCORS] Handling preflight request from origin: ${origin.getOrThrow()}")
            
            // 设置预检响应头
            ctx.header(JoyHttpConsts.HEADER_VARY, JoyHttpConsts.HEADER_ORIGIN)
            ctx.header(JoyHttpConsts.HEADER_VARY, JoyHttpConsts.HEADER_ACCESS_CONTROL_REQUEST_METHOD)
            ctx.header(JoyHttpConsts.HEADER_VARY, JoyHttpConsts.HEADER_ACCESS_CONTROL_REQUEST_HEADERS)
            
            // 允许所有来源
            //ctx.header(JoyHttpConsts.HEADER_ACCESS_CONTROL_ALLOW_ORIGIN, "http://127.0.0.1:8000/")
            ctx.header(JoyHttpConsts.HEADER_ACCESS_CONTROL_ALLOW_ORIGIN, "http://127.0.0.1:8000")
            // 允许的方法
            ctx.header(JoyHttpConsts.HEADER_ACCESS_CONTROL_ALLOW_METHODS, 
                "GET, POST, PUT, DELETE, PATCH, HEAD, OPTIONS")
            
            // 允许的头部
            ctx.header(JoyHttpConsts.HEADER_ACCESS_CONTROL_ALLOW_HEADERS, "*")
            
            // 允许凭据
            ctx.header(JoyHttpConsts.HEADER_ACCESS_CONTROL_ALLOW_CREDENTIALS, "true")
            
            // 最大缓存时间
            ctx.header(JoyHttpConsts.HEADER_ACCESS_CONTROL_MAX_AGE, "86400")
            
            // 直接返回200，不继续处理
            ctx.ok()
            return
        }
        
        // 处理实际请求
       if (origin.isSome()) {
            print("66666666666666666666666666666666666666666666666666666")
           // LogTool.info("[CustomCORS] Handling actual request from origin: ${origin.getOrThrow()}")
            
            // 设置Vary头部
            ctx.header(JoyHttpConsts.HEADER_VARY, JoyHttpConsts.HEADER_ORIGIN)
            
            // 允许所有来源
            ctx.header(JoyHttpConsts.HEADER_ACCESS_CONTROL_ALLOW_ORIGIN, "*")
            ctx.header(JoyHttpConsts.HEADER_ACCESS_CONTROL_ALLOW_METHODS, "GET, POST, PUT, DELETE, OPTIONS")
            // 允许凭据
            ctx.header(JoyHttpConsts.HEADER_ACCESS_CONTROL_ALLOW_CREDENTIALS, "true")
            
            // 暴露的头部
            ctx.header(JoyHttpConsts.HEADER_ACCESS_CONTROL_EXPOSE_HEADERS, 
                "Content-Length, Content-Type, Authorization")
        } 
        // 继续处理请求
        chain.next(ctx)
    }
}