import React from 'react'
import { IoLogoInstagram, IoLogoGooglePlaystore,IoLogoGithub } from "react-icons/io5";
import { GrAppleAppStore } from "react-icons/gr";

export const Footer = () => {


  const move=(e)=> {
    switch (e){
      case 1:
        window.open('https://www.instagram.com/lookin_min/');
        break;
      case 2:
        window.open('https://www.apple.com/kr/app-store/');
        break;
      case 3:
        window.open('https://play.google.com/store/games?hl=ko');
        break;
      case 4:
        window.open('https://github.com/lookinmin/viewing');
        break;
    }
  }

  
  return (
    <div className="footer">
      <div className="pageIcons">
        <IoLogoInstagram color='#faf5e4' size={40} onClick={() => move(1)}/>
        <GrAppleAppStore color='#faf5e4' size={40} onClick={() => move(2)}/>
        <IoLogoGooglePlaystore color='#faf5e4' size={40} onClick={() => move(3)}/>  
        <IoLogoGithub color='#faf5e4' size={40} onClick={() => move(4)}/>
      </div>
      <div className="footerLogo">
        <h2>Viewing : Review + Viewing.</h2>
        <h2>리뷰를 보다.</h2>
      </div>

      <div className="txts">
        <div className="div1">
          <p><span className='TT'>Address.</span>충청북도 청주시 서원구 충대로 1 충북대학교 S1-4 116호</p>
          <p><span className='TT'>Team.</span>제 10회 K-해커톤 충청권 예선통과팀. 핑퐁</p>
          
        </div>
        
        <div className="div2">
          <p><span className='TT'>E-mail.</span>sncalphs@gmail.com</p>
          <p><span className='TT'>Instagram.</span>@lookin_min</p>
        </div>
        
        <div className="div3">
          <p><span className='TT'>Leader.</span>조민수</p>
          <p>@ Copyright 2022 Viewing All rights reserved</p>
        </div>
      </div>

      
    </div>
  )
}
