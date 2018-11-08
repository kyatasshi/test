/*
 * 概要     ：ドコモ環境から取ってきた「POIデータ等の元データを格納するテーブル」を作成するDDL。
 *            dwh.landmark_busstopとdwh.landmark_busstop_nameテーブルにはこのDDLでデータをinsertする。
 *
 * 依存関係 ：「dwh」スキーマが既に存在していること(九大分析後が前提のため)。
 *
 * Note     ：このDDL以降、dwh.landmark_busstopとdwh.landmark_busstop_nameにデータをinsertする時は全てのカラムに対して値を指定する。
 *            → 元のMySQLではlandmark_id、landmark_name_idがAUTO_INCREMENTになっている。
 *            
 */


DROP TABLE IF EXISTS dwh.landmark_busstop CASCADE;
CREATE TABLE dwh.landmark_busstop 
(
  landmark_id INTEGER NOT NULL,
  lat DOUBLE PRECISION NOT NULL,
  lng DOUBLE PRECISION NOT NULL,
  PRIMARY KEY (landmark_id),
  CONSTRAINT landmark_IX1 UNIQUE (landmark_id)
)
;

INSERT INTO 
  dwh.landmark_busstop
VALUES 
  (30,35.458187,139.636985)
  , (31,35.454389,139.630904)
  , (32,35.453715,139.638133)
  , (33,35.458507,139.628741)
  , (34,35.452963,139.642093)
  , (35,35.445783,139.642958)
  , (36,35.443659,139.650847)
  , (37,35.447546,139.64358)
  , (38,35.443073,139.651914)
  , (39,35.44291,139.650404)
  , (40,35.450447,139.635947)
  , (41,35.45435,139.631762)
  , (42,35.456605,139.635327)
  , (43,35.443569,139.641792)
  , (44,35.448801,139.636702)
  , (45,35.45256,139.630848)
  , (46,35.462896,139.63236)
  , (47,35.448676,139.635696)
  , (48,35.443863,139.64702)
  , (49,35.445857,139.647636)
  , (50,35.443704,139.651332)
  , (51,35.451031,139.647069)
  , (52,35.441441,139.648505)
  , (53,35.441002,139.650809)
  , (54,35.443908,139.635249)
  , (55,35.454211,139.642721)
  , (56,35.450681,139.632446)
  , (57,35.4587,139.625091)
  , (58,35.454425,139.64064)
  , (59,35.447541,139.644914)
  , (60,35.455715,139.638114)
;


DROP TABLE IF EXISTS dwh.landmark_busstop_name CASCADE;
CREATE TABLE dwh.landmark_busstop_name 
(
  landmark_name_id INTEGER NOT NULL,
  landmark_id INTEGER NOT NULL,
  language CHAR(2) NOT NULL,
  real_name TEXT NOT NULL,
  short_name TEXT NOT NULL,
  PRIMARY KEY (landmark_name_id),
  CONSTRAINT landmark_name_landmark_id_language_uindex UNIQUE (landmark_id, language),
  CONSTRAINT landmark_name_landmark_landmark_id_fk FOREIGN KEY (landmark_id) REFERENCES dwh.landmark_busstop(landmark_id)
)
;

INSERT INTO
  dwh.landmark_busstop_name
VALUES
  (32,32,'ja','横浜ワールドポーターズ','横浜ワールドポーターズ')
  , (33,33,'ja','みなとみらいグランドセントラルタワー','みなとみらいグランドセントラルタワー')
  , (34,34,'ja','横浜赤レンガ倉庫','横浜赤レンガ倉庫')
  , (35,35,'ja','横浜情報文化センター','横浜情報文化センター')
  , (36,36,'ja','横浜マリンタワー','横浜マリンタワー')
  , (39,39,'ja','みなとみらい線　元町・中華街駅','みなとみらい線　元町・中華街駅')
  , (42,42,'ja','横浜ベイホテル東急','横浜ベイホテル東急')
  , (43,43,'ja','ダイワロイネットホテル横浜公園','ダイワロイネットホテル横浜公園')
  , (44,44,'ja','ホテルルートイン横浜馬車道','ホテルルートイン横浜馬車道')
  , (45,45,'ja','ニューオータニイン横浜プレミアム','ニューオータニイン横浜プレミアム')
  , (46,46,'ja','ホテルビスタプレミオみなとみらい','ホテルビスタプレミオみなとみらい')
  , (47,47,'ja','横浜平和プラザホテル','横浜平和プラザホテル')
  , (49,49,'ja','ホテルモントレ横浜','ホテル>モントレ横浜')
  , (50,50,'ja','ホテルメルパルク横浜','ホテルメルパルク横浜')
  , (51,51,'ja','横浜港大さん橋国際客船ターミナル','横浜港大さん橋国際客船ターミナル')
  , (52,52,'ja','横浜中華街朱雀門','横浜中華街朱雀門')
  , (53,53,'ja','横浜元町ショッピングストリート','横浜元町ショッピングストリート')
  , (55,55,'ja','MARINE & WALK YOKOHAMA','MARINE & WALK YOKOHAMA')
  , (57,57,'ja','横浜アンパンマンこどもミュージアム','横浜アンパンマンこどもミュージアム')
  , (58,58,'ja','ＪＩＣＡ横浜 （海外移住資料館）','ＪＩＣＡ横浜 （海外移住資料館）')
  , (59,59,'ja','シルク博物館','シルク博物館')
  , (60,60,'ja','横浜みなとみらい万葉倶楽部','横浜みなとみらい万葉倶楽部')
  , (61,30,'ja','ヨコハマ グランド インターコンチネンタル ホテル／パシフィコ横浜','ヨコハマ グランド インターコンチネンタ>ル ホテル／パシフィコ横浜')
  , (62,30,'en','InterContinental Yokohama Grand/Pacifico Yokohama','InterContinental Yokohama Grand/Pacifico Yokohama')
  , (63,54,'ja','イセザキ・モール','イセザキ・モール')
  , (64,54,'en','Isezaki Mall','Isezaki Mall')
  , (65,38,'ja','横浜人形の家','横浜人形の家')
  , (66,38,'en','Yokohama Doll Museum','Yokohama Doll Museum')
  , (67,40,'ja','みなとみらい線　馬車道駅','みなとみらい線　馬車道駅')
  , (68,40,'en','Bashamichi Sta.（Minato Mirai line MM06）','Bashamichi Sta.（Minato Mirai line MM06）')
  , (69,56,'ja','横浜桜木町ワシントンホテル','横浜桜木町ワシントンホテル')
  , (70,56,'en','Yokohama Sakuragicho Washington Hotel','Yokohama Sakuragicho Washington Hotel')
  , (71,31,'ja','横浜ランドマークタワー','横浜ランドマークタワー')
  , (72,31,'en','The Landmark Tower Yokohama','The Landmark Tower Yokohama')
  , (73,41,'ja','横浜ロイヤルパークホテル','横浜ロイヤルパークホテル')
  , (74,41,'en','Yokohama Royal Park Hotel','Yokohama Royal Park Hotel')
  , (75,37,'ja','横浜開港資料館','横浜開港資料館')
  , (76,37,'en','Yokohama Archives of History','Yokohama Archives of History')
  , (77,48,'ja','ローズホテル横浜（横浜中華街内）','ローズホテル横浜（横浜中華街内）')
  , (78,48,'en','Rose Hotel Yokohama (in Yokohama Chinatown)','Rose Hotel Yokohama (in Yokohama Chinatown)')
;

