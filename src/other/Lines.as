package other
{
	//import flash.geom.Point;
	//import flash.geom.Rectangle;
	
	import plant.Devil_Fern;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	import zombie.DaveZombie;

	public class Lines extends Sprite
	{
		public var speed:uint;
		//private var deadHitTRestObject:HitAttackRange=new HitAttackRange;
		public var ZombieWonX:Number,ZombieWonY:Number;
		public var LatestDeathZombieTime:uint=0;
		public var LatestDeathZombieNumber:uint=0;
		
		
		public var deadZombies:int=0;
		public var Plants:Array=new Array(9);
		//-----------------------------------------------------------------------------
		public var ZombieCapacity:uint=0;
		public var Zombies:Array=new Array;
		public var EmptyZombies:Array=new Array;
		public var EmptyZombieProduced:uint=1;
		public var PointZombie:uint=0;
		//-----------------------------------------------------------------------------
		public var Suns:Array=new Array;
		public var EmptySuns:Array=new Array;
		public var SunCapacity:uint=0;
		public var EmptySunProduced:uint=1;
		public var PointSun:uint=0;
		//-----------------------------------------------------------------------------
		public var Shadows:Array=new Array;
		public var Bullets:Array=new Array;
		public var ShadowCapacity:uint=0;
		//public var SunEnergyStore:uint=0;
		//private static const ShadowImage:Class=Assets.Shadow;
		private var ShadowTexture:Texture=Assets.getTexture("Shadow");
		public var i:int,j:int;
		public var SY:Number;
		public function Lines(sy:Number=0)
		{
			SY=sy;
			addEventListener(Event.ADDED_TO_STAGE,adts);
		}
		private function adts(event:Event):void
		{
			speed = parent.speed;
			for(i=0;i<9;i++)
			{
				Plants[i]=null;
			}
			Zombies[0]=null;
			EmptyZombies[0]=0;
			Suns[0]=null;
			EmptySuns[0]=0;
			removeEventListener(Event.ADDED_TO_STAGE,adts);
			addEventListener(Event.ENTER_FRAME,Control);
		}
		private function Control(event:Event):void
		{
			speed = parent.speed;
			var c:uint = 0;
			while(c < speed)
			{
				ZombieEatPlantsJudge();
				PlantDetectZombieJudge();
				BulletIfHitZombieJudge();
				c++;
			}
		}
		public function ShootBullet(BulletTexture:Texture, TargetX:int, TargetY:int, vx:int, vy:int, ExplodeFrames:Vector.<Texture>=null, hurtvalue:uint=20):void
		{
			for(j=0;j<=ShadowCapacity;j++)
			{
				if(Bullets[j]==null&&Shadows[j]==null)
				{
					Shadows[j]=new Image(ShadowTexture);
					addChild(Shadows[j]);
					
					
					Bullets[j]=new Bullet(BulletTexture,vx,vy,j,ExplodeFrames,hurtvalue);
					Bullets[j].x=TargetX;
					Bullets[j].y=TargetY;
					if(ExplodeFrames!=null)
					{
					    Bullets[j].ExplodeMovie=new MovieClip(ExplodeFrames,6);
						Bullets[j].Long=ExplodeFrames.length;
					}
					addChild(Bullets[j]);
					Shadows[j].width=Bullets[j].width;
					Shadows[j].height=Bullets[j].width/11.7*6.6;
					Shadows[j].x=TargetX;
					Shadows[j].y=SY+(18-Shadows[j].height)/2;
					return;
				}
			}
			ShadowCapacity++;
			Shadows[ShadowCapacity]=new Image(ShadowTexture);
			addChild(Shadows[ShadowCapacity]);
			Bullets[ShadowCapacity]=new Bullet(BulletTexture,vx,vy,j);
			Bullets[ShadowCapacity].x=TargetX;
			Bullets[ShadowCapacity].y=TargetY;
			addChild(Bullets[ShadowCapacity]);
			Shadows[ShadowCapacity].width=Bullets[j].width;
			Shadows[ShadowCapacity].height=Bullets[j].width/11.7*6.6;
			Shadows[ShadowCapacity].x=TargetX;
			Shadows[ShadowCapacity].y=SY+(18-Shadows[j].height)/2;
		}
		public function PlantDetectZombieJudge():void
		{
			for(i=0;i<9;i++)
			{
				if(Plants[i]!=null&&Plants[i].AttackChange=="AttackWithrange")
				{
					var FHZ:Boolean=false;
					for(j=0;j<=ZombieCapacity;j++)
					{
						if(Zombies[j]!=null&&HITTEST(Plants[i].AttackRangex+Plants[i].x,Plants[i].AttackRangey+Plants[i].y,Plants[i].AttackRangewidth,Plants[i].AttackRangeheight,Zombies[j].DetectRangex+Zombies[j].x,Zombies[j].DetectRangey+Zombies[j].y,Zombies[j].DetectRangewidth,Zombies[j].DetectRangeheight))//Plants[i].AttackRange.hitTestObject(Zombies[j].DetectRange))
						{
							FHZ=true;
							break;
						}
					}
					Plants[i].IfFrontHaveZombies=FHZ;
				}
			}
		}
		public var SpecialLevels:String = "";
		public function Plant(num:uint):void
		{
			if(SpecialLevels == "Level1")
			{
				addChild(Plants[num]);
				Plants[num].number=num;
				Plants[num].Grow();
				return;
			}
			addChild(Plants[num]);
			Plants[num].number=num;
			Plants[num].Extrafps = parent.Sspeed;
			Plants[num].Grow();
		}
		public function Level1_Tip4():void
		{
			parent.Tip4();
		}
		private function GetZombie(num:uint, Index:Number):DisplayObject
		{
			switch(num)
			{
				case 0:{return false;}
				case 1:{return new DaveZombie(Index);break;}
				case 2:{var zombieTarget:DaveZombie = new DaveZombie(Index);zombieTarget.WearHats(); return zombieTarget; break;}
				case 3:{var zombieTarget:DaveZombie = new DaveZombie(Index);zombieTarget.AddFlag(); return zombieTarget; break;}
				case 4:{var zombieTarget:DaveZombie = new DaveZombie(Index);zombieTarget.WearBuckets(); return zombieTarget; break;}
			}
		}
		public function DisposeBullets(j:int):void
		{
			if(Bullets[j]!=null)
			{
				removeChild(Shadows[j]);
				//removeChild(Bullets[j]);
				Bullets[j].dispose();
				//Shadows[j].dispose();
				Bullets[j]=null;
				//Shadows[j]=null;
			}
		}
		public function AddZombie(num:uint,dx:uint,dy:uint,Ifreturn:Boolean=false):void
		{
			if(num == 0){return;}
			
			if(PointZombie>EmptyZombieProduced-1)
			{
				ZombieCapacity++;
				Zombies[ZombieCapacity]=GetZombie(num, ZombieCapacity);
				if(Zombies[ZombieCapacity] == null){ return;}
				addChild(Zombies[ZombieCapacity]);
				parent.OnGroundZombies++;
				//Zombies[ZombieCapacity].number=ZombieCapacity;
				Zombies[ZombieCapacity].x=dx;
				Zombies[ZombieCapacity].y=dy;
				
				Zombies[ZombieCapacity].Extrafps = parent.Sspeed;
				Zombies[ZombieCapacity].Walk();
				
				PointZombie++;
				if(Ifreturn)
				{
					parent.uichaseRow=ZombieCapacity;
				}
				return;
			}
			Zombies[EmptyZombies[PointZombie]]=GetZombie(num, EmptyZombies[PointZombie]);
			if(Zombies[EmptyZombies[PointZombie]] == null){ return;}
			addChild(Zombies[EmptyZombies[PointZombie]]);
			parent.OnGroundZombies++;
			//Zombies[EmptyZombies[PointZombie]].number=EmptyZombies[PointZombie];
			Zombies[EmptyZombies[PointZombie]].x=dx;
			Zombies[EmptyZombies[PointZombie]].y=dy;
			
			Zombies[EmptyZombies[PointZombie]].Extrafps = parent.Sspeed;
			Zombies[EmptyZombies[PointZombie]].Walk();
			if(Ifreturn)
			{
				parent.uichaseRow=EmptyZombies[PointZombie];
			}
			
			PointZombie++;
		}
		public function PeacockFlowerJudge(Total:uint,dx:Number,dy:Number):void
		{
			//trace("Producing2...");
			for(i=0;i<Total;i++)
			{
				if(PointSun>EmptySunProduced-1)
				{
					SunCapacity++;
					//trace("CheckedNumber:"+String(SunCapacity));
					Suns[SunCapacity]=new Sun_Produce(SunCapacity);
					addChild(Suns[SunCapacity]);
					Suns[SunCapacity].number=SunCapacity;
					Suns[SunCapacity].produce(dx,dy);
					PointSun++;
					continue;
				}
				//trace("CheckedNumber:"+String(EmptySuns[PointSun]));
				Suns[EmptySuns[PointSun]]=new Sun_Produce(EmptySuns[PointSun]);
				addChild(Suns[EmptySuns[PointSun]]);
				Suns[EmptySuns[PointSun]].number=EmptySuns[PointSun];
				Suns[EmptySuns[PointSun]].produce(dx,dy);
				PointSun++;
			}
		}
		//----------------------------------------------------------------------------------------------------------------
		private function HITTEST(x1:int,y1:int,w1:int,h1:int,x2:int,y2:int,w2:int,h2:int):Boolean
		{
			//trace("HITTEST:x1:"+String(x1)+" "+String(y1)+" "+String(w1)+" "+String(h1)+" "+String(x2)+" "+String(y2)+" "+String(w2)+" "+String(h2)+";");
			var r1:int=x1+w1;
			var r2:int=x2+w2;
			var b1:int=y1+h1;
			var b2:int=y2+h2;
			if(r1<x2)
			{	return false;}
			if(r2<x1)
			{	return false;}
			if(b1<y2)
			{	return false;}
			if(b2<y1)
			{	return false;}
			return true;
		}
		public function KillZombie(num:uint):void
		{
			parent.prizex = Zombies[num].x;
			parent.prizey = Zombies[num].y;
			EmptyZombies[EmptyZombieProduced]=num;
			EmptyZombieProduced++;
			removeChild(Zombies[num]);
		 	Zombies[num].dispose();
			Zombies[num]=null;
			parent.OnGroundZombies--;
		}
		public function BulletIfHitZombieJudge():void
		{
			for(i=0;i<=ZombieCapacity;i++)
			{
				if(Zombies[i]!=null&&Zombies[i].Judge!="Dead"&&Zombies[i].life>0)
				{
					//trace("From BulletIfHitZombieJudge:"+String(i)+"is detected to Judge...");
					for(j=0;j<=ShadowCapacity;j++)
					{
						//trace("Judging...")
						if(Bullets[j]!=null&&HITTEST(Bullets[j].x,Bullets[j].y,Bullets[j].width,Bullets[j].height,Zombies[i].BeAttackRangex+Zombies[i].x,Zombies[i].BeAttackRangey+Zombies[i].y,Zombies[i].BeAttackRangewidth,Zombies[i].BeAttackRangeheight)&&!Bullets[j].ifexplode)//
						{
							//trace("Hit!");
							Bullets[j].Explode();
							removeChild(Shadows[j]);
							Shadows[j].dispose();
							Shadows[j]=null;
							if(Zombies[i].ArmorJudge!="None")
							{
								Zombies[i].Armorlife-=Bullets[j].HurtValue;
								Zombies[i].Flash();
								if(Zombies[i].Armorlife<=0)
									Zombies[i].fellArmor();
							}
							else
							{
								Zombies[i].life-=Bullets[j].HurtValue;
								Zombies[i].Flash();
							}
							if(Zombies[i].life<=0)
							{
								//trace("Kill!");
								Zombies[i].Dead();
								//LatestDeathZombieNumber=i;
								//LatestDeathZombieTime=0;
								//deadZombies++;
								break;
							}
						}
					}
				}
			}
		}
		public function ZombieEatPlantsJudge():void
		{
			//trace("Judge!");
			for(i=0;i<=ZombieCapacity;i++)
			{
				if(Zombies[i]==null)
				{continue;}/*
				if(Zombies[i]!=null&&Zombies[i].Judge!="Dead"&&deadHitTRestObject.hitTestObject(Zombies[i].AttackRange))
				{
					//trace("Dead!");
					if(Zombies[i] is LevelZombie_DaveZombie_Flash)
					{IfZombieWon=1;}
					ZombieWonX=Zombies[i].x;ZombieWonY=Zombies[i].y;
					removeChild(Zombies[i]);
					Zombies[i].Clean();
					Zombies[i]=null;
					AllControlTimer.stop();
					Clear();
				}*/
				if(Zombies[i].x + Zombies[i].AttackRangex <= 42)
				{
					var Result:Array = new Array();
					Zombies[i].visible = false;
					var zx :int = Zombies[i].x;
					var zy :int = Zombies[i].y;
					Result = Zombies[i].intoParts();
					KillZombie(i);
					parent.ZombieWon(Result[0],Result[1],Result[2],zx,zy);
					return;
				}
				var ifThisZombieEat:Boolean=false;
				if(Zombies[i].Judge!="Dead")
				{
					for(j=0;j<9;j++)
					{
						if(Plants[j]==null){continue;}
						if(HITTEST(Plants[j].BeAttackRangex+Plants[j].x,Plants[j].BeAttackRangey+Plants[j].y,Plants[j].BeAttackRangewidth,Plants[j].BeAttackRangeheight,Zombies[i].AttackRangex+Zombies[i].x,Zombies[i].AttackRangey+Zombies[i].y,Zombies[i].AttackRangewidth,Zombies[i].AttackRangeheight))
						{
							Plants[j].life-=Zombies[i].hurtvalue*3;
							Plants[j].Flash();
							if(Plants[j].life<=0)
							{
								if(Plants[j] is Devil_Fern)
								{
									Zombies[i].Curse();
									LatestDeathZombieNumber=i;
									LatestDeathZombieTime=0;
									deadZombies++;
								}
								removeChild(Plants[j]);
								Plants[j].dispose();
								Plants[j]=null;
							}
							ifThisZombieEat=true;
							if(Zombies[i].Judge!="Eating")
							{
								Zombies[i].Eat();
							}
							break;
						}
					}
					if(!ifThisZombieEat&&Zombies[i].Judge=="Eating")
					{
						Zombies[i].Walk();
					}
				}
			}
		}
		//----------------------------------------------------------------------------------------------------------------------------------
		public function clearSun(OfferedSun:Number,number:uint):void
		{
			parent.clearSun(-1,OfferedSun);
			//trace("CheckedNumber:"+String(number));
			Suns[number].dispose();
			removeChild(Suns[number]);
			//Suns[number].Clear();
			//Suns[number].dispose();
			Suns[number]=null;
			EmptySuns[EmptySunProduced]=number;
			EmptySunProduced++;
		}
	}
}