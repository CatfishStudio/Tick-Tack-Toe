package Tick_Tack_Toe 
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	
	/**
	 * ...
	 * @author Somov Evgeniy
	 */
	public class Statistics extends Sprite
	{
				
		public function Statistics() 
		{
			var listHeight:int;
			if (Level.totalGame.length > 0) listHeight = 50 * Level.totalGame.length;
			if(Level.totalGame.length < 1) listHeight = 50;
			
			/*Рабочая область*/
			this.graphics.beginFill(0x000000, 0);
			this.graphics.drawRect(0, 0, 600, listHeight);
			this.graphics.endFill();
			
			
			for (var i:int = 0; i <= Level.totalGame.length - 1; i++) {
				
				/*Текст*/
				var _textLabel:Label
				if(Level.totalGame[i][0] == 0) _textLabel = new Label(100, 30, 300, 50, "Aria", 16, 0xFFFFFF, "Ничья.")
				if(Level.totalGame[i][0] == 1) _textLabel = new Label(100, 30, 300, 50, "Aria", 16, 0xFFFFFF, "Победил сделав " + (Level.totalGame[i][1]-1) + " хода(ов).")
				if(Level.totalGame[i][0] == 2) _textLabel = new Label(100, 30, 300, 50, "Aria", 16, 0xFFFFFF, "Победил сделав " + Level.totalGame[i][1] + " хода(ов).")
				/*Иконка победителя + текст*/
				var winner:WinnerPers = new WinnerPers(Level.totalGame[i][0], _textLabel);
				winner.x = 200; winner.y = 90 * (i + 1);
				this.addChild(winner);
				
			}
			
		}
		
	}

}