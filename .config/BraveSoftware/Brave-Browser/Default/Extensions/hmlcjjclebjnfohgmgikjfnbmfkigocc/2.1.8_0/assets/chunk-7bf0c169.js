import{d as C,r as l,w as j,o as A,c as O,e,f as a,u as N,F as T,g as s,a as x,b as E}from"./chunk-a1f01ee3.js";import{m as I,_ as L,C as M,a as P,F as R,L as V,A as q}from"./chunk-4c861934.js";import{O as H}from"./chunk-3f92e865.js";const z=x("h3",null,"Security:",-1),D=x("h3",null,"Facebook privacy:",-1),G=x("h3",null,"Extra features:",-1),J=C({__name:"Options",setup(K){const[w,U]=I.useMessage(),F=l("free"),i=l(!0),r=l(!0),d=l(!1),k=l(!1),f=l(!1),m=l(!1),p=l(!1),b=l(!0),v=l(!1),h=l(!0),g=l(!1),u=l(!1);return chrome.storage.sync.get(H,c=>{F.value=c.account_type??"free",i.value=c.anti_clickjacking??!0,r.value=c.block_crypto_currency_mining??!0,d.value=c.block_facebook_pixel??!1,k.value=c.block_seen_chat??!1,f.value=c.block_seen_story_facebook??!1,m.value=c.block_seen_story_instagram??!1,p.value=c.block_typing_chat??!1,b.value=c.realtime??!0,v.value=c.remove_fbclid??!1,h.value=c.show_update_notification??!0,g.value=c.show_facebook_time_counter??!1,u.value=c.enable_extension_manager??!1}),j([u,i,r,d,k,f,m,p,b,v,h,g],([c])=>{chrome.storage.sync.set({anti_clickjacking:i.value,block_crypto_currency_mining:r.value,block_facebook_pixel:d.value,block_seen_chat:k.value,block_seen_story_facebook:f.value,block_seen_story_instagram:m.value,block_typing_chat:p.value,realtime:b.value,remove_fbclid:v.value,show_update_notification:h.value,show_facebook_time_counter:g.value,enable_extension_manager:u.value}),w.info("Options saved!"),c&&chrome.permissions.contains({permissions:["management"]},t=>{t||chrome.permissions.request({permissions:["management"]},n=>{n||(u.value=!1)})})}),l("1"),(c,t)=>{const n=M,_=P,y=R,S=V,B=L;return A(),O(T,null,[e(B,{class:"layout"},{default:a(()=>[e(S,{style:{padding:"20px 50px"}},{default:a(()=>[z,e(y,{name:"basic",autocomplete:"off"},{default:a(()=>[e(_,{name:"realtime"},{default:a(()=>[e(n,{checked:b.value,"onUpdate:checked":t[0]||(t[0]=o=>b.value=o)},{default:a(()=>[s("Real-Time Protection")]),_:1},8,["checked"])]),_:1}),e(_,{name:"anti_clickjacking"},{default:a(()=>[e(n,{checked:i.value,"onUpdate:checked":t[1]||(t[1]=o=>i.value=o)},{default:a(()=>[s("Anti-Clickjacking")]),_:1},8,["checked"])]),_:1}),e(_,{name:"block_crypto_currency_mining"},{default:a(()=>[e(n,{checked:r.value,"onUpdate:checked":t[2]||(t[2]=o=>r.value=o)},{default:a(()=>[s("Block cryptocurrency mining scripts")]),_:1},8,["checked"])]),_:1})]),_:1}),D,e(y,{name:"basic",autocomplete:"off"},{default:a(()=>[e(_,{name:"block_seen_story_facebook"},{default:a(()=>[e(n,{checked:f.value,"onUpdate:checked":t[3]||(t[3]=o=>f.value=o)},{default:a(()=>[s('Block the "Seen" feature in Facebook Stories')]),_:1},8,["checked"])]),_:1}),e(_,{name:"block_seen_story_instagram"},{default:a(()=>[e(n,{checked:m.value,"onUpdate:checked":t[4]||(t[4]=o=>m.value=o)},{default:a(()=>[s('Block the "Seen" feature in Instagram Stories')]),_:1},8,["checked"])]),_:1}),e(_,{name:"block_seen_chat"},{default:a(()=>[e(n,{checked:k.value,"onUpdate:checked":t[5]||(t[5]=o=>k.value=o)},{default:a(()=>[s('Block the "Seen" feature in Messenger')]),_:1},8,["checked"])]),_:1}),e(_,{name:"block_typing_chat"},{default:a(()=>[e(n,{checked:p.value,"onUpdate:checked":t[6]||(t[6]=o=>p.value=o)},{default:a(()=>[s("Block the typing indicator in Messenger")]),_:1},8,["checked"])]),_:1}),e(_,{name:"block_facebook_pixel"},{default:a(()=>[e(n,{checked:d.value,"onUpdate:checked":t[7]||(t[7]=o=>d.value=o)},{default:a(()=>[s("Block Facebook Pixel (Tracking Script)")]),_:1},8,["checked"])]),_:1}),e(_,{name:"remove_fbclid"},{default:a(()=>[e(n,{checked:v.value,"onUpdate:checked":t[8]||(t[8]=o=>v.value=o)},{default:a(()=>[s("Remove Facebook Click Identifier (Fbclid) from URL")]),_:1},8,["checked"])]),_:1})]),_:1}),G,e(y,{name:"basic",autocomplete:"off"},{default:a(()=>[e(_,{name:"show_facebook_time_counter"},{default:a(()=>[e(n,{checked:g.value,"onUpdate:checked":t[9]||(t[9]=o=>g.value=o)},{default:a(()=>[s("Show Facebook usage timer")]),_:1},8,["checked"])]),_:1}),e(_,{name:"enable_extension_manager"},{default:a(()=>[e(n,{checked:u.value,"onUpdate:checked":t[10]||(t[10]=o=>u.value=o)},{default:a(()=>[s("Enable extension manager")]),_:1},8,["checked"])]),_:1}),e(_,{name:"show_update_notification"},{default:a(()=>[e(n,{checked:h.value,"onUpdate:checked":t[11]||(t[11]=o=>h.value=o)},{default:a(()=>[s("Show update notification")]),_:1},8,["checked"])]),_:1})]),_:1})]),_:1})]),_:1}),e(N(U))],64)}}});E(J).use(q).mount("#app");
