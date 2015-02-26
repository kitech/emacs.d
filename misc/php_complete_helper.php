<?php

/*
  支持关键字
  支持函数，类，常量，
  支持函数原型(TODO 如何定参数位置）
 */

/*
  输出一整行，每个元素用;分号隔开。
 */

// $vars = get_defined_vars();

$funcs = get_defined_functions();
$classes = get_declared_classes();
$consts = get_defined_constants();
$interfaces = get_declared_interfaces();

// print_r($vars);
// print_r($funcs);

$keywords = array('__halt_compiler', 'abstract', 'and', 'array', 'as', 'break', 'callable', 'case',
                  'catch', 'class', 'clone', 'const', 'continue', 'declare', 'default', 'die', 'do',
                  'echo', 'else', 'elseif', 'empty', 'enddeclare', 'endfor', 'endforeach',
                  'endif', 'endswitch', 'endwhile', 'eval', 'exit', 'extends', 'final', 'for',
                  'foreach', 'function', 'global', 'goto', 'if', 'implements',
                  'include', 'include_once', 'instanceof', 'insteadof', 'interface', 'isset',
                  'list', 'namespace', 'new', 'or', 'print', 'private', 'protected', 'public',
                  'require', 'require_once', 'return', 'static', 'switch', 'throw', 'trait',
                  'try', 'unset', 'use', 'var', 'while', 'xor');
$predefined_constants = array('__CLASS__', '__DIR__', '__FILE__', '__FUNCTION__', '__LINE__',
                              '__METHOD__', '__NAMESPACE__', '__TRAIT__');

///////////////////
$elems = array();

// 处理函数列表
foreach ($funcs['internal'] as $func) {
    $refun = new ReflectionFunction($func);
    // print_r($refun->getParameters());

    $params = array();
    foreach ($refun->getParameters() as $key => $param) {
        // print_r($param);
        if ($param->isOptional()) {
            if ($param->isDefaultValueAvailable()) {
                if ($param->isDefaultValueConstant()) {
                    $params[] = "[\${$param->name} = {$param->getDefaultValueConstant()}]";
                } else {
                    $params[] = "[\${$param->name} = {$param->getDefaultValue()}]";
                }
            } else {
                $params[] = "[\${$param->name} = ???]";
            }
        } else {
            $params[] = "\${$param->name}";
        }
    }
    // print_r($params);
    $params_str = implode(', ', $params);
    $elems[] = "{$func}({$params_str})";
}

// 处理类列表：
$elems = array_merge($elems, $classes);
$elems = array_merge($elems, array_keys($consts));
$elems = array_merge($elems, $keywords);
$elems = array_merge($elems, $predefined_constants);
$elems = array_merge($elems, $interfaces);

// print_r($elems);
echo implode(';', $elems);



