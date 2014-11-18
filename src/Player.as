package
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{
		[Embed(source = "data/player.png")] protected var imgPlayer:Class;

		protected var _jumpPower:int;
		
		public function Player(X:int,Y:int)
		{
			super(X,Y);
			loadGraphic(imgPlayer, true, true,8)
			
			width = 8;
			height = 8;
			
			_jumpPower = 0;
			
			//basic player physics
			var runSpeed:uint = 120;
			drag.x = runSpeed*6;
			acceleration.y = 800;
			_jumpPower = 125;
			maxVelocity.x = runSpeed;
			maxVelocity.y = _jumpPower;
			
			addAnimation("idle", [0]);
		}
		
		override public function update():void
		{
			
			//MOVEMENT
			acceleration.x = 0;
			if(FlxG.keys.A)
			{
				facing = LEFT;
				acceleration.x -= drag.x;
			}
			else if(FlxG.keys.D)
			{
				facing = RIGHT;
				acceleration.x += drag.x;
			}
			if(FlxG.keys.justPressed("SPACE") && isTouching(FLOOR))
			{
				velocity.y = -_jumpPower;
			}
			
			play("idle");
		}
	}
}