const buttonPrev = document.getElementById('button-prev');
const buttonNext = document.getElementById('button-next');
const track = document.getElementById('track');
const slickList = document.getElementById('carrusel-lista');
const carousel = document.querySelectorAll('.carousel');

const slickWidth = carousel[0].offsetWidth;

buttonPrev.onclick = () => Move(1);
buttonNext.onclick = () => Move(2);

function Move(value){
    const trackWidth = track.offsetWidth;
    const listWidth = slickList.offsetWidth;
    
    track.style.left === "" ? leftPosition = track.style.left = 0 : leftPosition = parseFloat(track.style.left.slice(0, -2) * -1);
    
    if(leftPosition < (trackWidth - listWidth) && value === 2){
        track.style.left = `${-1 * (leftPosition + slickWidth)}px`;
    } else if(leftPosition > 0 && value === 1){
        track.style.left = `${-1 * (leftPosition - slickWidth)}px`;
    }
}

//function App(){}
//
//    window.onload = function(event){
//        var app = new App();
//        window.app = app;
//    }
//    
//    App.prototype.processingButton = function(event){
//        const btn = event.currentTarget;
//        const carruselList = event.currentTarget.parentNode;
//        const track = event.currentTarget.parentNode.querySelector('#track');
//        const carousel = track.querySelectorAll('.carousel');
//        
//        const carruselWidth = carousel[0].offsetWidth;
//        
//        const trackWidth = track.offsetWidth;
//        const listWidth = carruselList.offsetWidth;
//        
//        track.style.left === "" ? leftPosition = track.style.left = 0 : leftPosition = parseFloat(track.style.left.slice(0,-2) * -1);
//        btn.dataset.button === "button-prev" ? prevAction(leftPosition,carruselWidth,track) : nextAction(leftPosition,trackWidth,listWidth, carruselWidth, track);
//        
//    }
//    
//    let prevAction = (leftPosition, carruselWidth, track) => {
//        if(leftPosition > 0){
//            track.style.left = `${-1 * (leftPosition - carruselWidth)}px`;
//        }
//    }
//    
//    let nextAction = (leftPosition, trackWidth, listWidth, carruselWidth, track) => {
//        if(leftPosition < (trackWidth - listWidth)){
//            track.style.left = `${-1 * (leftPosition + carruselWidth)}px`;
//        }
//    }
//
//
