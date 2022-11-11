import axios from 'axios';

export function Get(url, data) {
    return _request('get', url, data);
}

export function Post(url, data) {
    return _request('post', url, data);
}

function _request(method, url, data) {
    return axios({
        method,
        url: process.env.NODE_ENV === 'production' ? url : `/api/${ url }`,
        data
    });
}