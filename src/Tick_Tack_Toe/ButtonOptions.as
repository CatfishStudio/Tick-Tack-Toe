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
	public class ButtonOptions extends Sprite
	{
		[Embed(source = '../../images/buttonUpS.png')]
		private var BImage:Class;
		private var _bImage:Bitmap = new BImage();
		[Embed(source = '../../images/buttonDownS.png')]
		private var BAImage:Class;
		private var _bAImage:Bitmap = new BAImage();
		
		public function ButtonOptions() 
		{
			this.x = 700;
			this.y = 10;
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			this.addChild(_bAImage);
			this.addChild(_bImage);
		}
		
		/*События кнопки меню.*/
		private function onMouseOut(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.AUTO;
			_bAImage.alpha = 0;
			_bImage.alpha = 1;
		}
		private function onMouseOver(e:MouseEvent):void
		{
			Mouse.cursor = MouseCursor.BUTTON;
			_bAImage.alpha = 1;
			_bImage.alpha = 0;
		}
	}

}