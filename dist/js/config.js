/**
 * application name
 * @type {string}
 */
const Title = 'VIRGINIA TECH';

/**
 * api url
 * @type {string}
 */
const BASE_URL = '//' + window.location.host

/**
 * init http library
 * @type http object
 */
let Request = Vue.http;

/**
 * session manager
 * @param key
 * @param data
 * @returns {string}
 */
function session(key = '', data = null) {
    if (data) {
        window.sessionStorage.setItem(key, data);
        return "true";
    }
    return window.sessionStorage.getItem(key);
}

/**
 * get url param
 * @returns value
 */
function get_url_param(key = '') {
    let param = {};
    let url = window.location.href;
    let arr = url.substr(url.indexOf('?') + 1).split('&');
    arr.forEach(item => {
        let tmp = item.split('=');
        param[tmp[0]] = tmp[1];
    });
    if (key) return param[key];
    return param
}

/**
 * link to some page
 * @param page
 * @param param
 * @param timeOut
 */
function redirect(page = '', param = {}, timeOut = null) {
    let p = [];
    Object.keys(param).forEach(key => {
        p.push(key + "=" + param[key]);
    })
    if (!timeOut) {
        window.location.href = p.length === 0 ? BASE_URL + '/dist/' + page + '.html' : BASE_URL + '/dist/' + page + '.html?' + p.join("&");
        return true;
    }
    setTimeout(function () {
        window.location.href = p.length === 0 ? BASE_URL + '/dist/' + page + '.html' : BASE_URL + '/dist/' + page + '.html?' + p.join("&");
    }, 500)
}

/**
 * retun a random number
 * @param lower
 * @param upper
 * @returns {*}
 */
function random(lower, upper) {
    return Math.floor(Math.random() * (upper - lower + 1)) + lower;
}