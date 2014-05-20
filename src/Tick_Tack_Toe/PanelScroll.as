package Tick_Tack_Toe 
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	public class PanelScroll extends Sprite 
	{
		/*Стрелки вверх-вниз */
		[Embed(source = '../../images/arrowUp.png')]
		private var BArrowUp:Class;
		[Embed(source = '../../images/arrowDown.png')]
		private var BArrowDown:Class;
		/*Спрайты кнопок*/
		private var _bUP:Sprite;
		private var _bDOWN:Sprite;
		private var _contentScroll:Sprite;
		private var _bArrowUp:Bitmap = new BArrowUp();
		private var _bArrowDown:Bitmap = new BArrowDown();
		
		public function PanelScroll(_content:Sprite) 
		{
			_contentScroll = _content;
			
			_bUP = new Sprite();
			_bArrowUp.x = 0; _bArrowUp.y = 0;
			_bArrowUp.smoothing = true;
			_bUP.addChild(_bArrowUp);
			_bUP.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutButtonUp);
			_bUP.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverButtonUp);
			_bUP.addEventListener(MouseEvent.CLICK, onMouseClickButtonUp);
			this.addChild(_bUP);
				
			_bDOWN = new Sprite();
			_bArrowDown.x = 0; _bArrowDown.y = 340;
			_bArrowDown.smoothing = true;
			_bDOWN.addChild(_bArrowDown);
			_bDOWN.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutButtonDown);
			_bDOWN.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverButtonDown);
			_bDOWN.addEventListener(MouseEvent.CLICK, onMouseClickButtonDown);
			this.addChild(_bDOWN);
		}
		
		/*События кнопки втрелка вверх --------------------*/
		private function onMouseClickButtonUp(e:MouseEvent):void
		{
			if(Options.soundOffOn) Level.snd2.play(); //воспроизведение звука
			if(_contentScroll.height > 400){
				if (_contentScroll.y <= 0 && _contentScroll.y >= 400 - _contentScroll.height) {
					_contentScroll.y = _contentScroll.y + 50;
					if (_contentScroll.y > 0) _contentScroll.y = 0;
					if (_contentScroll.y < 400 - _contentScroll.height) _contentScroll.y = 400 - _contentScroll.height;
				}
			}
		}
		private function onMouseOutButtonUp(e:MouseEvent):void
		{
			
			_bArrowUp.scaleX -= 0.1;
			_bArrowUp.scaleY -= 0.1;
			_bArrowUp.x += 0.1;
			_bArrowUp.y += 0.1;
			Mouse.cursor = MouseCursor.AUTO;
		}
		private function onMouseOverButtonUp(e:MouseEvent):void
		{
			_bArrowUp.scaleX += 0.1;
			_bArrowUp.scaleY += 0.1;
			_bArrowUp.x -= 0.1;
			_bArrowUp.y -= 0.1;
			Mouse.cursor = MouseCursor.BUTTON;
		}
		
		/*События кнопки втрелка вниз --------------------*/
		private function onMouseClickButtonDown(e:MouseEvent):void
		{
			if(Options.soundOffOn) Level.snd2.play(); //воспроизведение звука
			if(_contentScroll.height > 400){
				if (_contentScroll.y <= 0 && _contentScroll.y >= 400 - _contentScroll.height) {
					_contentScroll.y = _contentScroll.y - 50;
					if (_contentScroll.y > 0) _contentScroll.y = 0;
					if (_contentScroll.y < 490 - _contentScroll.height) _contentScroll.y = 490 - _contentScroll.height;
				}
			}
		}
		private function onMouseOutButtonDown(e:MouseEvent):void
		{
			_bArrowDown.scaleX -= 0.1;
			_bArrowDown.scaleY -= 0.1;
			_bArrowDown.x += 0.1;
			_bArrowDown.y += 0.1;
			Mouse.cursor = MouseCursor.AUTO;
		}
		private function onMouseOverButtonDown(e:MouseEvent):void
		{
			_bArrowDown.scaleX += 0.1;
			_bArrowDown.scaleY += 0.1;
			_bArrowDown.x -= 0.1;
			_bArrowDown.y -= 0.1;
			Mouse.cursor = MouseCursor.BUTTON;
		}
	}

}