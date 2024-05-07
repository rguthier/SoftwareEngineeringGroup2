
const ChatInput = document.querySelector(".chat-input textarea");
const SendChatBtn = document.querySelector(".chat-input span");
const chatBox = document.querySelector(".chatbox");
let UserMessage;
const API_KEY="sk-proj-8X98tpwlrxbMBQYFWJSoT3BlbkFJoVI62asQQZiMaZKdHGmL";
const createChatLi =(message,className)=>{
    const chatLi=document.createElement("li");
    chatLi.classList.add("chat", className);
    let chatContent = className === "outgoing" ? `<p> ${message}</p>`: `<span class="material-symbols-outlined">smart_toy</span><p> ${message}</p>`;
    chatLi.innerHTML = chatContent;
    return chatLi;
}

const generateResponse=(incomingChatLi)=>{
    const API_URL="https://api.openai.com/v1/chat/completions";
    const messageElement=incomingChatLi.querySelector("p");
    const requestOptions={
        method:"POST",
        headers:{
            "Content-Type":"application/json",
            "Authorization":`Bearer ${API_KEY}`
        },
        body:JSON.stringify({
            model:'gpt-3.5-turbo-0125',
            messages:[{role:"user",content:UserMessage}]
        })
    }
    fetch(API_URL,requestOptions).then(res=> res.json()).then(data=>{
        messageElement.textContent=data.choices[0].message.content;
    }).catch((error)=>{
        messageElement.textContent="Oops, Something Went Wrong, Please Try Again!"
    }).finally(()=> chatBox.scrollTo(0,chatBox.scrollHeight));
}
const handleChat= ()=>{
 UserMessage = ChatInput.value.trim();
 if(!UserMessage) return;
 ChatInput.value="";
 chatBox.appendChild(createChatLi(UserMessage,"outgoing"));
 chatBox.scrollTo(0,chatBox.scrollHeight);
 setTimeout(()=>{
    const incomingChatLi= createChatLi("thinking...","incoming");
    chatBox.appendChild(incomingChatLi);
    chatBox.scrollTo(0,chatBox.scrollHeight);
    generateResponse(incomingChatLi);
 },600);
}
SendChatBtn.addEventListener("click",handleChat);