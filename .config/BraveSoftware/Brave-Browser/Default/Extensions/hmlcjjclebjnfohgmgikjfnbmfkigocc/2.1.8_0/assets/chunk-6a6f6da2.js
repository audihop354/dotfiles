import{d as s,o as a,c,a as t,F as i,b as r}from"./chunk-a1f01ee3.js";const l=t("h1",null,"Warning: Phishing Attempt Blocked",-1),u=t("p",null," The link you attempted to access has been blocked to protect your safety. This website has been identified as a phishing site, which may try to steal your personal information. ",-1),_=t("p",null," If you believe this is an error and the website is safe, you can choose to continue at your own risk. Stay safe! ",-1),h=s({__name:"Blocked",setup(d){const o=()=>{window.close()},n=async()=>{const e=Math.random().toString(36).substring(2,15)+Math.random().toString(36).substring(2,15);await chrome.storage.local.set({bypass_token:e}),chrome.runtime.sendMessage({cmd:"continue_to_site"})};return(e,b)=>(a(),c(i,null,[l,u,_,t("div",{class:"buttons"},[t("button",{class:"button button-close",onClick:o},"Close tab"),t("button",{class:"button button-continue",onClick:n},"Continue")])],64))}});r(h).mount("#app");
