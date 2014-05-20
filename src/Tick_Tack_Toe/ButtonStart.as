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
	public class ButtonStart extends Sprite
	{
		/*Кнопка старт игры*/
		[Embed(source = '../../images/start.png')]
		private var BStartImage:Class;
		private var _bStartImage:Bitmap = new BStartImage();
		
		public function ButtonStart(x:int, y:int) 
		{
			this.x = x; this.y = y;
			_bStartImage.smoothing = true;
			this.addChild(_bStartImage);
			this.addEventListener(MouseEvent.CLICK, onMouseClickButton);
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOutButton);
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOverButton);
		}
		
		/*События левого персонажа*/
		private function onMouseClickButton(e:MouseEvent):void
		{
			if(Options.soundOffOn) Level.snd5.play(); //воспроизведение звука
			dispatchEvent(new Event(Event.CLOSE));
		}
		private function onMouseOutButton(e:MouseEvent):void
		{
			_bStartImage.scaleX -= 0.1;
			_bStartImage.scaleY -= 0.1;
			_bStartImage.x += 0.1;
			_bStartImage.y += 0.1;
			Mouse.cursor = MouseCursor.AUTO;
		}
		private function onMouseOverButton(e:MouseEvent):void
		{
			_bStartImage.scaleX += 0.1;
			_bStartImage.scaleY += 0.1;
			_bStartImage.x -= 0.1;
			_bStartImage.y -= 0.1;
			Mouse.cursor = MouseCursor.BUTTON;
		}
		
	}

}