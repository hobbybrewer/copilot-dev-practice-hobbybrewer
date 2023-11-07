import axios from "axios";

export default axios.create({
  baseURL: "https://shiny-acorn-v64jvpv96xwhp9g4-8080.app.github.dev/api",
  //baseURL: "https://action-codespace-wr6q7v7p7qgf5q79-8080.app.github.dev/api",
  headers: {
    "Content-type": "application/json",
    //"x-forwarded-for-ip": "200.20.0.88", // Rio De Janeiro
    //"x-forwarded-for-ip": "2.152.105.111" // Barcelona
    //"x-forwarded-for-ip": "8.210.96.219" // Hong Kong
    //"x-forwarded-for-ip": "78.135.85.96" // Beyoglu, Turkey
    //"x-forwarded-for-ip": "188.83.242.122" // Porta Portugal
  }
});
