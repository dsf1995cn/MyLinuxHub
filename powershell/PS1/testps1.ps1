#用于开启Powershell的命令行代理 by dsf
#使用方法：ssr -o

# param(
#     # Parameter help description
#     [Parameter(Mandatory)]$args
# )
function show_help {
    echo 'options:'
    echo '  -o|start open http proxy'
    echo '  -s|stop shutdown http proxy'
}
if($args.Count -eq 0)
{
    show_help
}
$value = $args
function set_proxy_variable {
    Set-Item Env:http_proxy "http://127.0.0.1:1080"  # 代理地址
    Set-Item Env:https_proxy "http://127.0.0.1:1080" # 代理地址
    echo '芝麻开门：Http代理已启动√'
}

function unset_proxy_variable {
    Remove-Item Env:http_proxy
    Remove-Item Env:https_proxy
    echo '芝麻关门：Http代理已关闭×'
}
switch ($value) {
    -o { set_proxy_variable }
    -s { unset_proxy_variable }
    start { set_proxy_variable }
    stop { unset_proxy_variable }
    Default {
        show_help
    }
}