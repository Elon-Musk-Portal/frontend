import {environment} from "./environment";
import axios from "axios";

export const server = axios.create({
    baseURL: environment.apiUrl,
    timeout: 1000
});
