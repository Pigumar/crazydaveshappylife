package plant
{
	import flash.display.Bitmap;
	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class LotusSeedPodShooter extends Plant
	{
		public var speed:uint;
		public var Showingframes:Vector.<Texture>;
		public var Shootingframes:Vector.<Texture>;
		public var IfFrontHaveZombies:Boolean=false;
		public var growcount:uint = 1;
		public var BulletTexture:Texture=Assets.getTexture("LotusSeedPodShooter_Bullet");
		
		public function LotusSeedPodShooter()
		{
			AttackChange="AttackWithrange";
			BeAttackRangex=46;
			BeAttackRangey=33.5;
			BeAttackRangewidth=34.7;
			BeAttackRangeheight=50.8;
			AttackRangex=62;
			AttackRangey=36;
			AttackRangewidth=596;
			AttackRangeheight=19;
			life=320;
			Showingframes = Assets.getTextures("LotusSeedPodShooter","LotusSeedPodShooterXML","LotusSeedPodShooter");//sTextureAtlas.getTextures("LotusSeedPodShooter");
			
			Shootingframes = Assets.getTextures("LotusSeedPodShooter_Shoot","LotusSeedPodShooter_ShootXML","LotusSeedPodShooter_Shoot");//sTextureAtlas.getTextures("LotusSeedPodShooter_Shoot");
			
			mMovie = new MovieClip(Showingframes, 24);
			mMovie.x = 0;
			mMovie.y = 0;
			Show();
		}
		public function Show(fps:uint=24):void
		{
			Starling.juggler.remove(mMovie);
			removeChild(mMovie);
			mMovie.dispose();
			mMovie = new MovieClip(Showingframes, fps*Extrafps);
			// centers the MovieClip
			mMovie.x = 0;
			mMovie.y = 0;
			// show it
			addChild ( mMovie );
			this.GetFilter();
			Starling.juggler.add(mMovie);
		}
		public function Grow(fps:uint=24):void
		{
			Starling.juggler.remove(mMovie);
			removeChild(mMovie);
			mMovie.dispose();
			mMovie = new MovieClip(Showingframes, fps*Extrafps);
			// centers the MovieClip
			mMovie.x = 0;
			mMovie.y = 0;
			// show it
			addChild ( mMovie );
			this.GetFilter();
			Starling.juggler.add(mMovie);
			addEventListener(Event.ENTER_FRAME,GrowFrame);
		}
		private function GrowFrame(event:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				growcount++;
				if(312<=growcount&&IfFrontHaveZombies)
				{
					growcount=192;
					removeEventListener(Event.ENTER_FRAME,GrowFrame);
					Starling.juggler.remove(mMovie);
					removeChild(mMovie);
					mMovie.dispose();
					mMovie = new MovieClip(Shootingframes, 24);
					mMovie.x=16;
					mMovie.y=-19;
					addChild ( mMovie );
					this.GetFilter();
					Starling.juggler.add(mMovie);
					//trace("Shoot!");
					mMovie.loop = false;
					addEventListener(Event.ENTER_FRAME,shoot);//return;
					return;
				}
				c++;
			}
		}
		private var Frames:Vector.<Texture> = Assets.getTextures("ExplodeLotusSeedPod","ExplodeLotusSeedPodXML","ExplodeLotusSeedPod");
		private function shoot(event:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				growcount++;
				if (growcount==204)
				{
					parent.ShootBullet(BulletTexture,79.5+x,48.7+y,12,0,Frames);
				}
				else if (growcount==205)
				{
					parent.ShootBullet(BulletTexture,82.5+x,37+y,12,0,Frames);
				}
				else if (growcount==208)
				{
					parent.ShootBullet(BulletTexture,92+x,64.5+y,12,0,Frames);
				}
				else if (growcount==210)
				{
					parent.ShootBullet(BulletTexture,81.5+x,55+y,12,0,Frames);
				}
				else if (growcount==211)
				{
					parent.ShootBullet(BulletTexture,81.5+x,55+y,12,0,Frames);
				}
				else if (growcount==213)
				{
					parent.ShootBullet(BulletTexture,98+x,77+y,12,0,Frames);
				}
				else if (growcount==214)
				{
					parent.ShootBullet(BulletTexture,90+x,73+y,12,0,Frames);
				}
				else if (growcount==215)
				{
					parent.ShootBullet(BulletTexture,90+x,73+y,12,0,Frames);
				}
				else if (growcount==217)
				{
					parent.ShootBullet(BulletTexture,93+x,57+y,12,0,Frames);
				}
				else if (growcount==219)
				{
					parent.ShootBullet(BulletTexture,105+x,61+y,12,0,Frames);
				}
				else if (growcount==220)
				{
					parent.ShootBullet(BulletTexture,100+x,55+y,12,0,Frames);
				}
				else if (growcount==221)
				{
					parent.ShootBullet(BulletTexture,97+x,78+y,12,0,Frames);
				}
				else if(mMovie.isComplete)
				{
					growcount=0;
					removeEventListener(Event.ENTER_FRAME,shoot);
					Grow();
					return;
	            }
				c++;
			}
		}
	}
}