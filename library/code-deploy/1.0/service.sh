#!/usr/bin/env php
<?php
/**
 * Created by 李垒(李雷) <leili@yoozoo.com>.
 * User: lilei
 * Date: 2018-10-27 14:47:58
 */
$http = new swoole_http_server("0.0.0.0", 4433);
$http->set([
    'worker_num'       => 4,
    'backlog'          => 128,
    'log_level'        => 1,
    'open_tcp_nodelay' => true,
    'daemonize'        => false,
    'log_file'         => '/data/code-deploy/logs/autopush-server.log',
]);
$http->on("start", function($server) {
    echo "Swoole http server is started at http://127.0.0.1:4433\n";
});
$http->on("request", function($request, $response) {
    $output = 'Hello!';
    $data   = $request->rawContent();
    if (!empty($data)) {
        $data = json_decode($data, true);
        if (!empty($data['repository']['name'])) {
            $cmd = "/data/code-deploy/update-{$data['repository']['name']}.sh";
            if (file_exists($cmd) == true) {
                $output = shell_exec($cmd);
            }else{
                $output = $cmd.' not found!';
            }
        }
    }
    $response->header("Content-Type", "text/plain");
    $response->end($output);
});
$http->start();