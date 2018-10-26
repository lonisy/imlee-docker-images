#!/usr/bin/env php
<?php
/**
 * Created by PhpStorm.
 * User: lonisy@163.com
 * Date: 2017/11/20
 * Time: 22:27
 */

$http = new swoole_http_server("0.0.0.0", 8001);
$http->set([
    'worker_num'       => 2,
    'open_tcp_nodelay' => true,
    'daemonize'        => false,
    'log_file'         => '/data/code-deploy/autopush-server.log',
]);
$http->on("start", function ($server) {
    echo "Swoole http server is started at http://127.0.0.1:8001\n";
});
$http->on("request", function ($request, $response) {
    $data = $request->rawContent();
    if (!empty($data)) {
        $data = json_decode($data, true);
        if (isset($data['repository']['name'])) {
            $cmd = "/data/code-deploy/update-{$data['repository']['name']}.sh";
            shell_exec($cmd);
        }
    }
});
$http->start();