import { Post } from '../methods';

/**
 * 登录
 * @param {*} data 
 * @returns 
 */
export function Login (data) {
    return Post('/login', data);
}