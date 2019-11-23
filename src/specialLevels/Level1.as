package specialLevels
{
	import other.Card;
	import other.Level;
	import other.Lines;
	import other.Tips;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	import zombie.DaveZombie;
	
	public class Level1 extends Level
	{
		public var Tip:Tips;
		public function Level1(showzombielist:Array=null, sceneType:String="DreamBackGround", otherMessage:Array=null, cardCodeList:Array=null, LevelContinue:Array=null)
		{
			super(showzombielist, sceneType, otherMessage, cardCodeList, LevelContinue);
			addEventListener(Event.ENTER_FRAME, detectBeginspecialWork);
		}
		public function detectBeginspecialWork(e:Event):void
		{
			if(bBeginSpecialWork)
			{
				removeEventListener(Event.ENTER_FRAME, detectBeginspecialWork);
				specialWork();
			}
		}
		public var Level1_CardSeat:Card;
		public function specialWork():void
		{
			//addEventListener(Event.ENTER_FRAME,level1_onEnterframe);
			Tip = new Tips("Tip1");
			addChild(Tip);
			Level1_CardSeat=new Card(-1,1);
			addChild(Level1_CardSeat);
			Level1_CardSeat.x=152;
			Level1_CardSeat.y=4;
			//this.backGroundImg.visible = false;
			this.arrLine[2] = new Lines(337);
			addChild(arrLine[2]);
			arrLine[2].SpecialLevels = "Level1";
		}
		public var IfShowedTip3:Boolean = false;
		public var IfShowedTip7:Boolean = false;
		public function Tip5():void
		{
			if(Tips != null)
			{
				removeChild(Tip);
				Tip.dispose();
			}
			Tip = new Tips("Tip5");
			addChild(Tip);
			if(tipwaitcount != 0)
				removeEventListener(Event.ENTER_FRAME, TipsWaiting);
			tipwaitcount = 0;
			addEventListener(Event.ENTER_FRAME, TipsWaiting);
		}
		public function Tip6():void
		{
			if(Tips != null)
			{
				removeChild(Tip);
				Tip.dispose();
			}
			Tip = new Tips("Tip6");
			addChild(Tip);
			if(tipwaitcount != 0)
				removeEventListener(Event.ENTER_FRAME, TipsWaiting);
			tipwaitcount = 0;
			addEventListener(Event.ENTER_FRAME, TipsWaiting);
		}
		public var tipwaitcount:uint = 0;
		public function TipsWaiting(e:Event):void
		{
			tipwaitcount++;
			if(tipwaitcount == 144)
			{
				if(Tips != null)
				{
				    removeChild(Tip);
				    Tip.dispose();
				}
				tipwaitcount = 0;
				removeEventListener(Event.ENTER_FRAME, TipsWaiting);
			}
		}
		public function Tip4():void
		{
			Level1_IfShowedTip4 = true;
			if(Tips != null)
			{
				removeChild(Tip);
				Tip.dispose();
			}
			Tip = new Tips("Tip4");
			addChild(Tip);
		}
		public function Tip7():void
		{
			IfShowedTip7 = true;
			if(Tips != null)
			{
				removeChild(Tip);
				Tip.dispose();
			}
			Tip = new Tips("Tip7");
			addChild(Tip);
		}
		public var IfShowedTip8:Boolean = false;
		public function Tip8():void
		{
			IfShowedTip8 = true;
			if(Tips != null)
			{
				removeChild(Tip);
				Tip.dispose();
			}
			Tip = new Tips("Tip8");
			addChild(Tip);
		}
		public var IfShowedTip9:Boolean = false;
		
		public function Tip9():void
		{
			IfShowedTip9 =true;
			if(Tips != null)
			{
				removeChild(Tip);
				Tip.dispose();
			}
			Tip = new Tips("Tip9");
			addChild(Tip);
			if(tipwaitcount != 0)
				removeEventListener(Event.ENTER_FRAME, TipsWaiting);
			tipwaitcount = 0;
			addEventListener(Event.ENTER_FRAME, TipsWaiting);
			addEventListener(Event.ENTER_FRAME, Level1_LevelContinue);
		}
		private function Level1_LevelContinue(e:Event):void
		{
			Level1_Continue();
		}
		private var Level1_ileveltimecount:uint = 0;
		public function KillZombie(num:uint):void
		{
			Level1_ileveltimecount ++;
			if(arrLine[2].Zombies[num] != null)
			{
				arrLine[2].removeChild(arrLine[2].Zombies[num]);
				arrLine[2].Zombies[num].dispose();
				arrLine[2].Zombies[num]=null;
			}
		}
		public function Level1_Continue():void
		{
			if(Level1_ileveltimecount == 0)
			{
				addEventListener(Event.ENTER_FRAME, PushTip);
				AddProgressBar();
				for(var l1c:uint = 0;l1c < 5;l1c++)
				{
					arrLine[2].Zombies[l1c] = new DaveZombie(l1c);
					arrLine[2].Zombies[l1c].x = 818;
					arrLine[2].Zombies[l1c].y = 216;
				}
				
				arrLine[2].ZombieCapacity = 4;
				addChild(arrLine[2].Zombies[0]);
				arrLine[2].Zombies[0].x = 818;
				arrLine[2].Zombies[0].y = 216;
				arrLine[2].Zombies[0].Walk();
				dCanGotProgressBarWidth = 39;
				dGotProgressBarWidth = 0;
			}
			if(Level1_ileveltimecount == 1){return;}
			if(Level1_ileveltimecount == 2)
			{
				addChild(arrLine[2].Zombies[1]);
				arrLine[2].Zombies[1].x = 818;
				arrLine[2].Zombies[1].y = 216;
				arrLine[2].Zombies[1].Walk();
				dCanGotProgressBarWidth = 78;
			}
			if(Level1_ileveltimecount == 3){return;}
			if(Level1_ileveltimecount == 4)
			{
				addChild(arrLine[2].Zombies[2]);
				arrLine[2].Zombies[2].x = 818;
				arrLine[2].Zombies[2].y = 216;
				arrLine[2].Zombies[2].Walk();
				dCanGotProgressBarWidth = 118;
			}
			Level1_ileveltimecount ++;
			if(Level1_ileveltimecount == 5){return;}
			if(Level1_ileveltimecount == 6)
			{
				imgHugeWaveZombiealarm = new Image(Assets.getTexture("FinalFlagSign"));
				imgHugeWaveZombiealarm.x = 400 - imgHugeWaveZombiealarm.width / 2;
				imgHugeWaveZombiealarm.y = 300 - imgHugeWaveZombiealarm.height / 2;
				
				addChild(imgHugeWaveZombiealarm);
				imgHugeWaveZombiealarm.alpha=0;
				Flagcount=0;
				addEventListener(Event.ENTER_FRAME, FlagFrames);
			}
			if(Level1_ileveltimecount == 7)
			{
				addChild(arrLine[2].Zombies[3]);
				arrLine[2].Zombies[3].x = 818;
				arrLine[2].Zombies[3].y = 216;
				arrLine[2].Zombies[3].Walk();
				dCanGotProgressBarWidth = 118;
			}
			if(Level1_ileveltimecount == 32)
			{
				addChild(arrLine[2].Zombies[4]);
				arrLine[2].Zombies[4].x = 818;
				arrLine[2].Zombies[4].y = 216;
				arrLine[2].Zombies[4].Walk();
				dCanGotProgressBarWidth = 118;
			}
			if(arrLine[2].Zombies[4] != null && arrLine[2].Zombies[4] != 1 && arrLine[2].Zombies[4].life <= 0)
			{
				prizex = arrLine[2].Zombies[4].x;
				prizey = arrLine[2].Zombies[4].y;
			}
			if(arrLine[2].Zombies[4] == null)
			{
				trace("Win!");
				arrLine[2].Zombies[4] = 1;
				speed = 0;
				stopAllMc(this);
				Paused = true;
				ileveltypecount ++;
				for(var i:uint = 0;i < this.numChildren; i++)
				{
					if(getChildAt(i) is DisplayObject)
					{
						getChildAt(i).touchable = false;
						if(getChildAt(i) is Sprite)
						{
						    getChildAt(i).flatten();
						}
					}
				}
				if(PrizeTexture != null);
				else
				{
					Prize = new Card(2,-2);
					addChild(Prize);
					Prize.x = prizex;
					Prize.y = prizey;
					addChild(PrizeCovery);
					PrizeCovery.x = prizex;
					PrizeCovery.y = prizey;
					PrizeCovery.Dark(0);
					PrizeCovery.alpha = 0.01;
				}
				addEventListener(Event.ENTER_FRAME,afterwin);
			}
			/*
			if(arrLevelContinue[ileveltypecount]=="AddProgressBar:")
			{
				ileveltypecount ++;
				//ilevelcount = ileveltypecount;
				ileveltimecount=0;
				Flagcount=0;
				
			}*//*
			trace("Doing...");
			//trace(ileveltypecount+" "+ileveltimecount+" "+ilevelcount+" "+uichaseLine+" "+uichaseRow);
			if(arrLevelContinue[ileveltypecount]=="SetFlagMassage:")
			{
				dGotProgressBarWidth = 0;
				dCanGotProgressBarWidth = 0;
				dProgressBarWidth = arrLevelContinue[ileveltypecount+1];
				dDevideZombies = arrLevelContinue[ileveltypecount+2];
				ileveltypecount +=3;
				ilevelcount = ileveltypecount;
				ileveltimecount=0;
				Flagcount=0;
			}
			if(arrLevelContinue[ileveltypecount]=="Begin:")
			{
				if(!IfBeganPushTip)
				{
					IfBeganPushTip = true;
					addEventListener(Event.ENTER_FRAME, PushTip);
				}
				ileveltimecount++;
				if(ileveltimecount==arrLevelContinue[ilevelcount+1]||KilledChaseZombie())
				{
					var s:uint=Math.ceil(Math.random()*10)%5;
					while(arrLine[s]==null)
					{s=Math.ceil(Math.random()*10)%5;}
					
					var Zombiey:int;
					switch(s)
					{
						case 0:Zombiey=54;break;
						case 1:Zombiey=135;break;
						case 2:Zombiey=216;break;
						case 3:Zombiey=297;break;
						case 4:Zombiey=378;break;
					}
					uichaseLine = s;
					arrLine[s].AddZombie(arrLevelContinue[ilevelcount+2],818,Zombiey,true);
					dCanGotProgressBarWidth += (dProgressBarWidth/dDevideZombies);
					ilevelcount+=2;
					if(arrLevelContinue[ilevelcount+1] is String)
					{
						ileveltypecount = ilevelcount+1;
						ilevelcount = ileveltypecount+3;
						ileveltimecount=0;
					}
				}
			}
			if(arrLevelContinue[ileveltypecount]=="Continue:")
			{
				ileveltimecount++;
				if(ileveltimecount==arrLevelContinue[ileveltypecount+1])
				{
					ileveltimecount=0;
					
					arrLine[2].AddZombie(arrLevelContinue[ilevelcount],818,216);
					dCanGotProgressBarWidth += (dProgressBarWidth/dDevideZombies);
					ilevelcount+=1;
					if(arrLevelContinue[ilevelcount+1] is String)
					{
						ileveltypecount = ilevelcount+1;
						ilevelcount++;
						ileveltimecount=0;
					}
				}
			}
			if(arrLevelContinue[ileveltypecount]=="Flag:")
			{
				ileveltypecount ++;
				//ilevelcount = ileveltypecount;
				ileveltimecount=0;
				imgHugeWaveZombiealarm = new Image(Assets.getTexture("FlagSign"));
				imgHugeWaveZombiealarm.x = 400 - imgHugeWaveZombiealarm.width / 2;
				imgHugeWaveZombiealarm.y = 300 - imgHugeWaveZombiealarm.height / 2;
				addChild(imgHugeWaveZombiealarm);
				imgHugeWaveZombiealarm.alpha=0;
				Flagcount=0;
				addEventListener(Event.ENTER_FRAME, FlagFrames);
			}
			if(arrLevelContinue[ileveltypecount]=="FinalFlag:")
			{
				if(imgHugeWaveZombiealarm != null){return;}
				//trace("I'm HandSome!");
				ileveltimecount++;
				if(ileveltimecount==144)
				{
					ileveltypecount ++;
					ilevelcount = ileveltypecount;
					ileveltimecount=0;
					imgHugeWaveZombiealarm = new Image(Assets.getTexture("FinalFlagSign"));
					imgHugeWaveZombiealarm.x = 400 - imgHugeWaveZombiealarm.width / 2;
					imgHugeWaveZombiealarm.y = 300 - imgHugeWaveZombiealarm.height / 2;
					
					addChild(imgHugeWaveZombiealarm);
					imgHugeWaveZombiealarm.alpha=0;
					Flagcount=0;
					addEventListener(Event.ENTER_FRAME, FlagFrames);
				}
			}
			if(arrLevelContinue[ileveltypecount]=="RaiseFlags:")
			{
				ileveltypecount += 2;
				ilevelcount = ileveltypecount - 1;
				ileveltimecount=0;
				Flagcount=0;
				RaiseFlag(arrLevelContinue[ilevelcount]);
				ilevelcount ++;
			}
			if(arrLevelContinue[ileveltypecount]=="ProducedAllZombiesFromFlag:")
			{
				ileveltypecount ++;
				ilevelcount = ileveltypecount;
				ileveltimecount=0;
				Flagcount=0;
				dCanGotProgressBarWidth += (dProgressBarWidth/dDevideZombies);
			}*/
		}
		public function Tip3():void
		{
			if(IfShowedTip3 && !IfShowedTip9){Tip9();return;}
			if(IfShowedTip3){return;}
			IfShowedTip3 = true;
			if(Tips != null)
			{
				removeChild(Tip);
				Tip.dispose();
			}
			Tip = new Tips("Tip3");
			addChild(Tip);
			addEventListener(Event.ENTER_FRAME, Level1_Enterframe);
			removeEventListener(Event.ENTER_FRAME, onlyReadyImagePut);
			SpecialLevels = "Level1";
		}
		public function Tip2(IfChosen:Boolean):void
		{
			if(IfShowedTip3){return;}
			if(IfChosen)	
			{
				if(Tips != null)
				{
					removeChild(Tip);
					Tip.dispose();
				}
				Tip = new Tips("Tip2");
				addChild(Tip);
			}
			else
			{
				if(Tips != null)
				{
					removeChild(Tip);
					Tip.dispose();
				}
				Tip = new Tips("Tip1");
				addChild(Tip);
			}
		}
	}
}