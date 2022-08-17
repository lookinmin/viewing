import { Menu } from './Menu';
import React, { useState, useEffect} from 'react';
import $ from 'jquery';


export const About = () => {

  const [scrollPosition, setScrollPosition] = useState(0);      //현재 스크롤 하는 부분이 어딘지 받아올 State
  const updateScroll = () => {
    setScrollPosition(window.scrollY || document.documentElement.scrollTop);
  }
  useEffect(()=>{
      window.addEventListener('scroll', updateScroll);
  });
  class Scroll extends React.Component{
    constructor() {
      super();
        this.state = {
          scrollTop: 0
        }
    }
       
    componentDidMount = () => {
      window.addEventListener('scroll', this.handleScroll);
    }
    componentWillUnMount = () => {
      window.removeEventListener('scroll', this.handleScroll);
    }

    handleScroll = () => {
      const scrollTop = ('scroll', scrollPosition);
      this.setState({
        scrollTop
      })
      
    

      if(450 > scrollTop && scrollTop > 0){
        const y1 = $(".men1").offset().top;
        window.scrollTo({top : y1, behavior: "smooth"})
        console.log("일단해" + 11)
      }
      else if(1500 > scrollTop && scrollTop >= 450){
        const y2 = $(".men2").offset().top;
        window.scrollTo({top : y2, behavior: "smooth"})
        console.log("일단해" + 22)
      }
      else if(2700 > scrollTop && scrollTop >= 1500){
        const y3 = $(".men3").offset().top;
        window.scrollTo({top : y3, behavior: "smooth"})
        console.log("일단해" + 33)
      }
      else if(scrollTop >= 2700){
        const y4 = $(".men4").offset().top;
        window.scrollTo({top : y4, behavior: "smooth"})
        console.log("일단해" + 44)
      }
    }
  }

  const scr = new Scroll();

  function scrollToTop(){
    //스크롤 속도를 빠르게 하려면 이동 간격 시간을 줄이거나, 이동 크기 픽셀을 늘리면 됩니다.
    let between = 16; // 이동 간격 시간
    let scroll = window.setInterval(function() {
      let pos = window.pageYOffset;
      let step = 20; // 이동 크기 픽셀
      if ( pos > 0 ) {
          window.scrollTo( 0, pos - step );
      } else {
          window.clearInterval( scroll );
      }
    }, between);
  }

  return (
    <div className='aboutDiv' onScroll={scr.handleScroll()}>
      <h2 id='logo' onClick={() => scrollToTop()} className="grey">Viewing</h2>
      <div className="men1" >
        <Menu/>
        <div className="aboutTxt" id='target1' >
          <h2>실 거주자들의 <span className='t2'>찐</span> 거주후기를 보다.</h2>
          <h2 className='t2'>Viewing : Review + Viewing</h2>
        </div>
      </div>
      <div className="men2" >
        <div className="aboutTxt1" id='target2'>
          <h2><span className='t2'>Viewing</span>은 여러분과 함께 성장합니다.</h2>
          <h2>더욱 많은 리뷰들로 <span className='t2'>Viewing</span>을 도와주세요.</h2>
        </div>
      </div>
      <div className="men3">
        <div className="aboutTxt2" id='target3'>
          <h2>설레이는 자취생활, 새로운 지역에서 홀로서기.</h2>
          <h2><span className='t2'>Viewing</span>이 힘이 되어드립니다.</h2>
        </div>
      </div>
      <div className="men4" >
        <div className="aboutTxt3" id='target4'>
          <h2><span className='t2'>Viewing</span>은 제 10회 K-해커톤과 함께합니다.</h2>
          <h2>충청권 팀.<span className='t2'> 핑퐁</span></h2>
        </div>
        <div className="aboutTxt4">
          <a href='https://kr.freepik.com/psd/wall'>Wall psd는 rawpixel.com - kr.freepik.com가 제작함</a>
        </div>
      </div>
    </div>
  )
}
