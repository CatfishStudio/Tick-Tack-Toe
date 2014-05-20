package Tick_Tack_Toe 
{
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	public class Label extends TextField
	{
		
		public function Label(x:int, y:int, w:int, h:int, font:String, size:int, color:int, text:String) 
		{
			this.x = x;	this.y = y;
			this.width = w;	this.height = h;
			this.defaultTextFormat = new TextFormat(font, size, color);
			this.htmlText = text;
		}
		
	}

}