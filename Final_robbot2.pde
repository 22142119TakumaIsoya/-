float baseH = 60;
float armL1 = 60; // ロボットアームの各関節の長さ
float armL2 = 40;
float armL3 = 30;
float armW1 = 20; // 各関節の太さ
float armW2 = 20;
float armW3 = 10;
float angle0 = 0; // ベースの角度
float angle1 = 0; // 第1関節の角度
float angle2 = 0; // 第2関節の角度
float l3 = 0; // エンドエフェクターの高さ
float dif = 0.5; // 関節の動きの速さ

void setup() {
  size(800, 800, P3D);
  camera(300 * cos(angle0), -300, 300 * sin(angle0),0,0,0,0,0,-1); // カメラの位置
  noStroke();
}

void draw() {
  background(255);
        
  
  // ライトの設定
  lights();
  
  // 関節0の位置
  PVector joint0 = new PVector(0, 0, baseH);
  
  // リンク1の末端の位置
  PVector end1 = new PVector(armL1 * cos(angle0), armL1 * sin(angle0), baseH);
  end1.add(joint0);
  
  // リンク2の末端の位置
  PVector end2 = new PVector(end1.x + armL2 * cos(angle0 + angle1), end1.y + armL2 * sin(angle0 + angle1), baseH);
  
  // リンク3の末端の位置
  PVector end3 = new PVector(end2.x + armL3 * cos(angle0 + angle1 + angle2), end2.y + armL3 * sin(angle0 + angle1 + angle2), l3);
  
  // リンク0を描画
  stroke(0);
  line(joint0.x, joint0.y, joint0.z, end1.x, end1.y, end1.z);
  
  // リンク1を描画
  strokeWeight(armW1);
  line(end1.x, end1.y, end1.z, end2.x, end2.y, end2.z);
  
  // リンク2を描画
  strokeWeight(armW2);
  line(end2.x, end2.y, end2.z, end3.x, end3.y, end3.z);
  
  // リンク3を描画
  strokeWeight(armW3);
  line(end2.x, end2.y, end2.z, end3.x, end3.y, end3.z);
  
  // エンドエフェクターを描画
  fill(255, 0, 0);
  noStroke();
  translate(end3.x, end3.y, end3.z);
  sphere(10);
}

// キーボード入力でロボットアームを操作
void keyPressed() {
  if (keyCode == UP) {
    angle0 += 5*PI / 180; // ベースを回転
  } else if (keyCode == DOWN) {
    angle0 -= 5*PI / 180;
  } else if (keyCode == LEFT) {
    angle1 += 5*PI / 180; // 第1関節を回転
  } else if (keyCode == RIGHT) {
    angle1 -= 5*PI / 180;
  } else if (key == 'a') {
    angle2 += 5*PI / 180; // 第2関節を回転
  } else if (key == 'd') {
    angle2 -= 5*PI / 180;
  }
}
