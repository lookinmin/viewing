import { Footer } from './Footer'
import { Menu } from './Menu'
import { MdHomeFilled } from 'react-icons/md';
import styles from './Home.module.css';
import React, { useRef, useState, useEffect } from 'react';
import { useIntersectionObserver } from './useIntersectionObserver.ts';
import { IoClipboardOutline,IoLogoGooglePlaystore } from "react-icons/io5";
import { GiMoneyStack, GiPaperClip } from "react-icons/gi";



export const Home = () => {
  const [scrollPosition, setScrollPosition] = useState(0);      //현재 스크롤 하는 부분이 어딘지 받아올 State
  const updateScroll = () => {
    setScrollPosition(window.scrollY || document.documentElement.scrollTop);
  }
  useEffect(()=>{
      window.addEventListener('scroll', updateScroll);
  });

  const moveTop = () => {                                   //로고 누르면 최상단으로 이동하는 코드
    window.scrollTo({top: 0, behavior : "smooth"});
  }
   

  const target1 = useRef(null)
  const target2 = useRef(null)
  const target3 = useRef(null)
  const target4 = useRef(null)

  const img1 = useRef(null)
  const img2 = useRef(null)
  const img3 = useRef(null)
                                                                  //스크롤 구간에 맞춰 Fing 글자 Fade IN
  useIntersectionObserver(target1, styles.animation);
  useIntersectionObserver(target2, styles.animation);
  useIntersectionObserver(target3, styles.animation);
  useIntersectionObserver(target4, styles.animation);
  //<MdHomeFilled size="70" color='#FF6363'/>
  useIntersectionObserver(img1, styles.imgAni);
  useIntersectionObserver(img2, styles.imgAni);
  useIntersectionObserver(img3, styles.imgAni);

  return (
    
    <div className="home">
      <div className='mainPage'>
        <h2 id='logo' onClick={() => moveTop()} className={scrollPosition < 1000 ? "white" : "orange"}>Viewing</h2>
        <div className="top">
          <h2>당신의 새로운 집,</h2>
          <h2><span className='t2'>뷰잉(Viewing)</span>과 함께</h2>
          
        </div>
      </div>

      <Menu/>

      <div className="toDownload">
        <img src="./img/viewingLogo.png" alt="fing" height="60px" id='downImg'/>
        <h2 id='yyy'>Download</h2>
        <IoLogoGooglePlaystore color='#FAF5E4' size={30}/>
      </div>

      <div className="txtsBox">
        <h2 id='y1'>설레이는 자취생활,</h2>
        <h2 id='y2'><span className='t1' ref={target1}>Viewing<MdHomeFilled size="60" color= '#FF6363'/></span>으로부터.</h2>
      </div>

      <div className="itemsList">
        <div className="items">
          <div className="box">
            <span className='icons'><GiPaperClip size="50"/></span>
          </div>
          <h2>실 거주자들의 <span className='t2'>찐</span> 거주후기</h2>
        </div>
        <div className="items">
          <div className="box">
            <span className='icons'><GiMoneyStack size="50"/></span>
          </div>
          <h2><span className='t2'>지역</span>별로 볼 수 있는 평균금액</h2>
        </div>
        <div className="items">
          <div className="box">
            <span className='icons'><IoClipboardOutline size="50"/></span>
          </div>
          <h2><span className='t2'>소통</span>을 위한 자유게시판</h2>
        </div>
      </div>

      <div className="exOne">
        <div className="txtBox">
          <h2>집 구하기 막막할 때</h2>
          <h3>찐 거주리뷰는</h3>
          <h3><span className='t1' ref={target2}>Viewing</span>과 함께</h3>
        </div>
        <img className='homeImg' ref={img1} src="./img/pic1.jpg" height="500px" alt="" />
      </div>

      
      <div className="exOne">
        <div className="txtBox">
          <h2>사회 초년생들을 위한</h2>
          <h3>설레이는 자취생활은</h3>
          <h3><span className='t1' ref={target3}>Viewing</span>과 함께</h3>
        </div>
        <img className='homeImg' ref={img2} src="./img/pic2.jpg" height="500px" alt="" />
      </div>

      <div className="exOne">
        <div className="txtBox">
          <h2>평균 보증금, 월세를 한 눈에</h2>
          <h3>지역별로 나누어</h3>
          <h3><span className='t1' ref={target4}>Viewing</span>과 함께</h3>
        </div>
        <img className='homeImg' ref={img3} src="./img/pic3.jpg" height="500px" alt="" />
      </div>


     <Footer></Footer>

    </div>
  )
}
