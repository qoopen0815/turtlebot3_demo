# Turtlebot3 デモ用Docker環境

このリポジトリはTurtlebot3の公式チュートリアルに沿ってデモ用Docker環境を提供します。  
この環境を使ってROS2とTurtlebot3を簡単に試すことができます。

## 概要

このリポジトリは、以下の機能を提供します。

* ROS2開発環境
* Turtlebot3シミュレーション環境

## セットアップ

```bash
git clone https://github.com/qoopen0815/turtlebot3_demo.git
cd turtlebot3_demo
docker compose up -d --build
```

## デモの実行

1. コンテナへのアクセス（例：developコンテナ）

```bash
docker exec -it develop /bin/bash
```
  
2. Gazebo起動

turtlebot3_gazeboパッケージのGazeboシミュレーションは起動に失敗するので、nav2_bringupパッケージのlaunchファイルを使用しています。  
[nav2 -getting_started-](https://navigation.ros.org/getting_started/index.html#getting-started)

```bash
ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False
```

## トラブルシューティング

問題が発生した場合は、以下のリソースを参照してください。

* Turtlebot3公式ドキュメント: [https://www.turtlebot.com/turtlebot3/](https://www.turtlebot.com/turtlebot3/)
* Docker公式ドキュメント: [https://docs.docker.com/](https://docs.docker.com/)

## 謝辞

このリポジトリの作成にあたり、多くの方にご協力いただきました。ありがとうございました。
