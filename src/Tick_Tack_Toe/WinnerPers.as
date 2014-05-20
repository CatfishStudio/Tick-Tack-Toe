package Tick_Tack_Toe 
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	public class WinnerPers extends Sprite
	{
		private var _iconImage:Bitmap;
		
		
		public function WinnerPers(pers:int, _textLabel:Label) 
		{
							
			if (pers == 1) _iconImage = new Level.XImage1;
			if (pers == 2) _iconImage = new Level.OImage1;
			if (pers != 0) {
				this.addChild(_iconImage);
				this.addChild(_textLabel);
			}else {
				this.addChild(_textLabel);
			}
		}
		
	}

}