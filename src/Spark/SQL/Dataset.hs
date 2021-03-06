{-# LANGUAGE IncoherentInstances #-}

module Spark.SQL.Dataset where

import Java
import Scala
import Spark.SQL.Internal.Types
import qualified Spark.SQL.Internal.Dataset as S

agg :: (t <: Object) => Column -> [Column]
                               -> Java (Dataset t) (Dataset Row)
agg t1 t2 = S.agg t1 (toJava t2)

-- foreign import java unsafe agg :: (t <: Object) => Column -> ColumnArray
--                                ->Java (Dataset t) (Dataset Row)

-- foreign import java unsafe agg2 :: (t <: Object) => Column -> Seq Column
--                                 ->Java (Dataset t) (Dataset Row)

foreign import java unsafe agg3 :: (t <: Object) => Map JString JString
                                ->Java (Dataset t) (Dataset Row) --Todo

foreign import java unsafe agg4 :: (t <: Object) => Map JString JString
                                ->Java (Dataset t) (Dataset Row) --Todo

-- foreign import java unsafe agg5 :: (t <: Object) => Tuple2 JString JString -> Seq (Tuple2 JString JString)
--                                 -> Java (Dataset t) (Dataset Row) --Todo

foreign import java unsafe alias :: (t <: Object) => String
                              -> Java (Dataset t) (Dataset t)

-- foreign import java unsafe alias2 :: (t <: Object) => Symbol
--                                  -> Java (Dataset t) (Dataset t)

foreign import java unsafe apply :: (t <: Object) => String
                                -> Java (Dataset t) (Column)

foreign import java unsafe as :: (t <: Object, u <: Object) => Encoder u
                              -> Java (Dataset t) (Dataset u)

foreign import java unsafe as2 :: (t <: Object) => String
                               -> Java (Dataset t) (Dataset t)

-- foreign import java unsafe as3 :: (t <: Object) => Symbol
--                               -> Java (Dataset t) (Dataset t)

foreign import java unsafe cache :: (t <: Object) => Java (Dataset t) (Dataset t)

foreign import java unsafe checkpoint :: (t <: Object) => Java (Dataset t) (Dataset t)

foreign import java unsafe checkpoint2 :: (t <: Object) => Bool -> Java (Dataset t) (Dataset t)

-- foreign import java unsafe classTag :: (t <: Object) => Java (Dataset t) (ClassTag t) --TODO

foreign import java unsafe coalesce :: (t <: Object) => Int -> Java (Dataset t) (Dataset t)

foreign import java unsafe col :: (t <: Object) => String
                               -> Java (Dataset t) (Column)

foreign import java unsafe collect :: (t <: Object) => Java (Dataset t) (Object)

foreign import java unsafe collectAsList :: (t <: Object) => Java (Dataset t) (List t)

foreign import java unsafe columns :: (t <: Object) => Java (Dataset t) (JStringArray)

foreign import java unsafe count :: (t <: Object) => Java (Dataset t) (Int64)

foreign import java unsafe createGlobalTempView :: (t <: Object) => String -> Java (Dataset t) ()

foreign import java unsafe createOrReplaceTempView :: (t <: Object)
                                                   => String -> Java (Dataset t) ()

foreign import java unsafe createTempView :: (t <: Object) => String -> Java (Dataset t) ()

foreign import java unsafe crossJoin :: (t <: Object) => Dataset b -> Java (Dataset t) (Dataset row)

foreign import java unsafe cube:: (t <: Object) => ColumnArray -> Java (Dataset t) (RelationalGroupedDataset)

-- foreign import java unsafe cube2 :: (t <: Object) => Seq Column -> Java (Dataset t) (RelationalGroupedDataset)

-- foreign import java unsafe cube2 :: (t <: Object)
--                                  => JString -> Seq Column -> Java (Dataset t) (RelationalGroupedDataset)

cube2 :: (t <: Object) => String -> [String] -> Java (Dataset t) (RelationalGroupedDataset)
cube2 t1 t2 = S.cube2 t1 (toJava $ (map toJava t2 :: [JString]))

-- foreign import java unsafe cube4 :: (t <: Object)
--                                  => JString -> JStringArray -> Java (Dataset t) (RelationalGroupedDataset)

-- foreign import java unsafe describe :: (t <: Object) => Seq JString -> Java (Dataset t) (Dataset row)

foreign import java unsafe describe :: (t <: Object) => String -> Java (Dataset t) (Dataset row)

-- foreign import java unsafe distinct :: (t <: Object) => Seq JString -> Java (Dataset t) (Dataset t)

foreign import java unsafe drop :: (t <: Object) => Column -> Java (Dataset t) (Dataset row)

-- foreign import java unsafe drop2 :: (t <: Object) => Seq JString -> Java (Dataset t) (Dataset row)

drop2 :: (t <: Object) => [String] -> Java (Dataset t) (Dataset row)
drop2 t = S.drop2 (toJava $ (map toJava t :: [JString]))

--foreign import java unsafe drop3 :: (t <: Object) => JStringArray -> Java (Dataset t) (Dataset row)

foreign import java unsafe drop4 :: (t <: Object) => String -> Java (Dataset t) (Dataset row)

foreign import java unsafe dropDuplicates :: (t <: Object) => Java (Dataset t) (Dataset t)

-- foreign import java unsafe dropDuplicates2 :: (t <: Object) => Seq JString -> Java (Dataset t) (Dataset t)

-- dropDuplicates2 :: (t <: Object) => [String] -> Java (Dataset t) (Dataset t)
-- dropDuplicates2 t = S.dropDuplicates2 (toJava $ map toJava t)

--foreign import java unsafe dropDuplicates3 :: (t <: Object) => JStringArray -> Java (Dataset t) (Dataset t)

-- foreign import java unsafe dropDuplicates4 :: (t <: Object)
--                                           => JString -> Seq JString -> Java (Dataset t) (Dataset t)

dropDuplicates3 :: (t <: Object) => String -> [String] -> Java (Dataset t) (Dataset t)
dropDuplicates3 t1 t2 = S.dropDuplicates3 t1 (toJava (map toJava t2 :: [JString]))

-- foreign import java unsafe dropDuplicates5 :: (t <: Object)
--                                            => JString -> JStringArray -> Java (Dataset t) (Dataset t)
dtypes :: (t <: Object) => Java (Dataset t) (String, String)
dtypes = fmap ((\(x :: JString, y :: JString) -> (fromJava x, fromJava y)) . fromJava) S.dtypes

-- foreign import java unsafe dtypes :: (t <: Object) => Java (Dataset t) (Tuple2 JString JString)

foreign import java unsafe except:: (t <: Object) => Dataset t -> Java (Dataset t) (Dataset t)

foreign import java unsafe explain :: (t <: Object) => Java (Dataset t) ()

foreign import java unsafe explain2 :: (t <: Object) => Bool -> Java (Dataset t) ()

-- foreign import java unsafe explode :: (t <: Object, a <: Product)
--                                   => Seq Column -> Functional (TraversableOnce B) -> Java (Dataset t) (Dataset Row)--TODO
--
-- foreign import java unsafe explode2 :: (t <: Object)
--                                   => JString -> JString -> Functional (TraversableOnce B) -> Java (Dataset t) (Dataset Row) --TODO

foreign import java unsafe filter :: (t <: Object) => Column -> Java (Dataset t) (Dataset t)

filter2 :: (t <: Object) => (forall a. t -> Java a Bool) -> Java (Dataset t) (Dataset t)
filter2 t = S.filter2 (mkFilterFun t)

--foreign import java unsafe filter2 :: (t <: Object) => FilterFunction t -> Java (Dataset t) (Dataset t)

--foreign import java unsafe filter3 :: (t <: Object) => Function1 t -> Java (Dataset t) (Dataset t)

foreign import java unsafe filter4 :: (t <: Object) => String -> Java (Dataset t) (Dataset t)

foreign import java unsafe first :: (t <: Object) => Java (Dataset t) (t)

flatMap :: (t <: Object, u <: Object)
        => (forall a. t -> Java a (Iterator u))
        -> Encoder u
        -> Java (Dataset t) (Dataset u)
flatMap t1 t2 = S.flatMap (mkFlatMapFun t1) t2

-- foreign import java unsafe flatMap :: (t <: Object, u <: Object)
--                                     => FlatMapFunction t u -> Encoder u -> Java (Dataset t) (Dataset u)

-- foreign import java unsafe flatMap2 :: (t <: Object, u <: Object)
--                                     => Function1 t (TraversableOnce u) -> Encoder u -> Java (Dataset t) (Dataset u)

foreach :: (t <: Object) => (forall a. t -> Java a ()) -> Java (Dataset t) ()
foreach t = S.foreach (mkForeachFun t)

--foreign import java unsafe foreach :: (t <: Object) => ForeachFunction t -> Java (Dataset t) ()

--foreign import java unsafe foreach2 :: (t <: Object) => Function1 t BoxedUnit -> Java (Dataset t) ()

foreachPartition :: (t <: Object) => (forall a. t -> Java a ()) -> Java (Dataset t) ()
foreachPartition t = S.foreachPartition (mkForeachPartitionFun t)

--foreign import java unsafe foreachPartition :: (t <: Object) => ForeachPartitionFunction t -> Java (Dataset t) ()

-- foreign import java unsafe foreachPartition :: (t <: Object)
--                                             => Function1 (Iterator t) BoxedUnit -> Java (Dataset t) ()

foreign import java unsafe groupBy :: (t <: Object) => ColumnArray -> Java (Dataset t) (RelationalGroupedDataset)--TODO

-- foreign import java unsafe groupBy2 :: (t <: Object) => Seq Column -> Java (Dataset t) (RelationalGroupedDataset)

-- foreign import java unsafe groupBy3 :: (t <: Object) => JString -> Seq JString -> Java (Dataset t) (RelationalGroupedDataset)

foreign import java unsafe "groupBy" groupBy2 :: (t <: Object) => String -> JStringArray -> Java (Dataset t) (RelationalGroupedDataset)

-- foreign import java unsafe groupByKey :: (t <: Object, k<: Object)
--                                     => Function1 t k -> Encoder k -> Java (Dataset t) (KeyValueGroupedDataset k t)

groupByKey :: (t <: Object, k<: Object)
            => (forall a. t -> Java a k) -> Encoder k
            -> Java (Dataset t) (KeyValueGroupedDataset k t)
groupByKey t1 t2 = S.groupByKey (mkMapFun t1) t2

-- foreign import java unsafe groupByKey2 :: (t <: Object, k<: Object)
--                                     => MapFunction t k -> Encoder k -> Java (Dataset t) (KeyValueGroupedDataset k t)

foreign import java unsafe head :: (t <: Object) => Java (Dataset t) (t)

foreign import java unsafe head2 :: (t <: Object) => Int -> Java (Dataset t) (Object)

foreign import java unsafe inputFiles :: (t <: Object) =>  Java (Dataset t) (JStringArray)--todo

foreign import java unsafe intesect :: (t <: Object) => Dataset t -> Java (Dataset t) (Dataset t)

foreign import java unsafe isLocal :: (t <: Object) => Java (Dataset t) (Bool)

foreign import java unsafe isStreaming :: (t <: Object) => Java (Dataset t) (Bool)

foreign import java unsafe javaRDD :: (t <: Object) => Java (Dataset t) (JavaRDD t)

foreign import java unsafe join :: (t <: Object) => Dataset b -> Java (Dataset t) (Dataset row)

foreign import java unsafe join2 :: (t <: Object) => Dataset b -> Column -> Java (Dataset t) (Dataset row)

foreign import java unsafe join3 :: (t <: Object) => Dataset b -> Column -> String -> Java (Dataset t) (Dataset row)

-- foreign import java unsafe join4 :: (t <: Object) => Dataset b -> Seq JString -> Java (Dataset t) (Dataset row)
--
-- foreign import java unsafe join5 :: (t <: Object) => Dataset b -> Seq JString -> JString -> Java (Dataset t) (Dataset row)

foreign import java unsafe join4 :: (t <: Object) => Dataset b -> String -> Java (Dataset t) (Dataset row)

foreign import java unsafe joinWith :: (t <: Object, u <:Object)
                                    => Dataset u -> Column -> Java (Dataset t) (Dataset (Tuple2 t t))

foreign import java unsafe joinWith2 :: (t <: Object, u <:Object)
                                  => Dataset u -> Column -> String -> Java (Dataset t) (Dataset (Tuple2 t t))

foreign import java unsafe limit :: (t <: Object) => Int -> Java (Dataset t) (Dataset t)

-- foreign import java unsafe map :: (t <: Object, u <: Object)
--                                => Function1 t u -> Encoder u -> Java (Dataset t) (Dataset u)

foreign import java unsafe map2 :: (t <: Object, u <: Object)
                              => MapFunction t u -> Encoder u -> Java (Dataset t) (Dataset u)

-- foreign import java unsafe mapPartitions :: (t <: Object, u <: Object)
--                                => Function1 (Iterator t) (Iterator u) -> Encoder u -> Java (Dataset t) (Dataset u)

mapPartitions :: (t <: Object, u <: Object)
               => (forall a. t -> Java a (Iterator u)) -> Encoder u -> Java (Dataset t) (Dataset u)
mapPartitions t1 t2 = S.mapPartitions (mkMapPartitionsFun t1) t2 --todo

-- foreign import java unsafe mapPartitions2 :: (t <: Object, u <: Object)
--                               => MapPartitionsFunction t u -> Encoder u -> Java (Dataset t) (Dataset u)

foreign import java unsafe na :: (t <: Object) => Java (Dataset t) (DataFrameNaFunctions)

foreign import java unsafe ofRows :: (t <: Object) => SparkSession -> LogicalPlan -> Java (Dataset t) (Dataset row)

foreign import java unsafe orderBy :: (t <: Object) => ColumnArray -> Java (Dataset t) (Dataset t)

-- foreign import java unsafe orderBy2 :: (t <: Object) => Seq Column -> Java (Dataset t) (Dataset t)
--
-- foreign import java unsafe orderBy3 :: (t <: Object) => JString -> Seq Column -> Java (Dataset t) (Dataset t)

orderBy2 :: (t <: Object) => String -> [String] -> Java (Dataset t) (Dataset t)
orderBy2 t1 t2 = S.orderBy2 t1 (toJava $ (map toJava t2 :: [JString]))

--foreign import java unsafe orderBy4 :: (t <: Object) => JString -> JStringArray -> Java (Dataset t) (Dataset t)

foreign import java unsafe persist :: (t <: Object) => Java (Dataset t) (Dataset t)

foreign import java unsafe persist2 :: (t <: Object) => StorageLevel -> Java (Dataset t) (Dataset t)

foreign import java unsafe printSchema :: (t <: Object) => Java (Dataset t) ()

foreign import java unsafe queryExecution :: (t <: Object) => Java (Dataset t) (QueryExecution)

randomSplit :: (t <: Object) => [Double] -> Java (Dataset t) (DatasetArray t)
randomSplit t = S.randomSplit (toJava t)

--foreign import java unsafe randomSplit :: (t <: Object) => JDoubleArray -> Java (Dataset t) (DatasetArray t)

randomSplit2 :: (t <: Object) => [Double] -> Int64 -> Java (Dataset t) (DatasetArray t)
randomSplit2 t1 t2 = S.randomSplit2 (toJava t1) t2

--foreign import java unsafe randomSplit2 :: (t <: Object) => JDoubleArray -> Int64 -> Java (Dataset t) (DatasetArray t)

randomSplitAsList :: (t <: Object) => [Double] -> Int64 -> Java (Dataset t) (List (Dataset t))
randomSplitAsList t1 t2 = S.randomSplitAsList (toJava t1) t2

--foreign import java unsafe randomSplitAsList :: (t <: Object) => JDoubleArray -> Int64 -> Java (Dataset t) (List (Dataset t))

foreign import java unsafe rdd :: (t <: Object) => Java (Dataset t) (RDD t)

reduce :: (t <: Object) => (forall a. t -> t -> Java a t) -> Java (Dataset t) (t)
reduce t = S.reduce (mkFun2 t)

--foreign import java unsafe reduce :: (t <: Object) => Function2 t t t -> Java (Dataset t) (t)

reduce2 :: (t <: Object) => (forall a. t -> t -> Java a t) -> Java (Dataset t) (t)
reduce2 t = S.reduce2 (mkReduceFun t) --todo

--foreign import java unsafe reduce2 :: (t <: Object) => ReduceFunction t -> Java (Dataset t) (t)

foreign import java unsafe registerTempTable :: (t <: Object) => String -> Java (Dataset t) ()

repartition :: (t <: Object) => [Column] -> Java (Dataset t) (Dataset t)
repartition t = S.repartition (toJava t)

--foreign import java unsafe repartition :: (t <: Object) => ColumnArray -> Java (Dataset t) (Dataset t)

foreign import java unsafe repartition2 :: (t <: Object) => Int -> Java (Dataset t) (Dataset t)

repartition3 :: (t <: Object) => Int -> [Column] -> Java (Dataset t) (Dataset t)
repartition3 t1 t2 = S.repartition3 t1 (toJava t2)

--foreign import java unsafe repartition3 :: (t <: Object) => Int -> ColumnArray -> Java (Dataset t) (Dataset t)

-- foreign import java unsafe repartition4 :: (t <: Object) => Int -> Seq Column -> Java (Dataset t) (Dataset t)
--
-- foreign import java unsafe repartition5 :: (t <: Object) => Seq Column -> Java (Dataset t) (Dataset t)

rollup :: (t <: Object) => [Column] -> Java (Dataset t) (RelationalGroupedDataset)
rollup t = S.rollup (toJava t)

--foreign import java unsafe rollup :: (t <: Object) => ColumnArray -> Java (Dataset t) (RelationalGroupedDataset)

-- foreign import java unsafe rollup2 :: (t <: Object) => Seq Column -> Java (Dataset t) (RelationalGroupedDataset)
--
-- foreign import java unsafe rollup3 :: (t <: Object) => JString -> Seq Column -> Java (Dataset t) (RelationalGroupedDataset)

rollup2 :: (t <: Object) => String -> [String] -> Java (Dataset t) (RelationalGroupedDataset)
rollup2 t1 t2 = S.rollup2 t1 (toJava $ (map toJava t2 :: [JString]))

--foreign import java unsafe rollup4 :: (t <: Object) => JString -> JStringArray -> Java (Dataset t) (RelationalGroupedDataset)

foreign import java unsafe sample :: (t <: Object) => Bool -> Double -> Java (Dataset t) (Dataset t)

foreign import java unsafe sample2 :: (t <: Object) => Bool -> Double -> Int64 -> Java (Dataset t) (Dataset t)

foreign import java unsafe sample3 :: (t <: Object) => Bool -> JDouble -> Java (Dataset t) (Dataset t)

foreign import java unsafe schema :: (t <: Object) => Java (Dataset t) (StructType)

select :: (t <: Object) => [Column] -> Java (Dataset t) (Dataset row)
select t = S.select (toJava t)

--foreign import java unsafe select :: (t <: Object) => ColumnArray -> Java (Dataset t) (Dataset row)

-- foreign import java unsafe select2 :: (t <: Object) => Seq Column -> Java (Dataset t) (Dataset row)
--
-- foreign import java unsafe select3 :: (t <: Object) => JString -> Seq JString -> Java (Dataset t) (Dataset row)

select2 :: (t <: Object) => String -> [String] -> Java (Dataset t) (Dataset row)
select2 t1 t2 = S.select2 t1 (toJava $ (map toJava t2 :: [JString]))

--foreign import java unsafe select4 :: (t <: Object) => JString -> JStringArray -> Java (Dataset t) (Dataset row)

foreign import java unsafe "select" select3 :: (t <: Object, u1 <: Object) => TypedColumn t u1 -> Java (Dataset t) (Dataset u1)

foreign import java unsafe "select" select4 :: (t <: Object, u1 <: Object, u2 <: Object)
                                   => TypedColumn t u1 -> TypedColumn t u2 -> Java (Dataset t) (Dataset (Tuple2 u1 u2)) --todo

foreign import java unsafe "select" select5 :: (t <: Object, u1 <: Object, u2 <: Object, u3 <: Object)
                                  => TypedColumn t u1 -> TypedColumn t u2 -> TypedColumn t u3 -> Java (Dataset t) (Dataset (Tuple3 u1 u2 u3)) --todo

foreign import java unsafe "select" select6 :: (t <: Object, u1 <: Object, u2 <: Object, u3 <: Object, u4 <: Object)
                                   => TypedColumn t u1 -> TypedColumn t u2 -> TypedColumn t u3 -> TypedColumn t u4 -> Java (Dataset t) (Dataset (Tuple4 u1 u2 u3 u4))--todo


foreign import java unsafe "select" select7 :: (t <: Object, u1 <: Object, u2 <: Object, u3 <: Object, u4 <: Object, u5 <: Object)
                                  => TypedColumn t u1 -> TypedColumn t u2 -> TypedColumn t u3 -> TypedColumn t u4 -> TypedColumn t u5 -> Java (Dataset t) (Dataset (Tuple5 u1 u2 u3 u4 u5)) --todo

-- foreign import java unsafe selectExpr :: (t <: Object) => Seq JString -> Java (Dataset t) (Dataset row)
--
-- selectExpr2 :: (t <: Object) => Seq [JString] -> Java (Dataset t) (Dataset row)
-- selectExpr2 t = S.selectExpr2 (toJava t)

--foreign import java unsafe selectExpr2 :: (t <: Object) => Seq JStringArray -> Java (Dataset t) (Dataset row)

foreign import java unsafe show :: (t <: Object) => Java (Dataset t) ()

foreign import java unsafe show2 :: (t <: Object) => Bool -> Java (Dataset t) ()

foreign import java unsafe show3 :: (t <: Object) => Int -> Java (Dataset t) ()

foreign import java unsafe show4 :: (t <: Object) => Int -> Bool -> Java (Dataset t) ()

foreign import java unsafe show5 :: (t <: Object) => Int -> Int -> Java (Dataset t) ()

sort :: (t <: Object) => [Column] -> Java (Dataset t) (Dataset t)
sort t = S.sort (toJava t)

--foreign import java unsafe sort :: (t <: Object) => ColumnArray -> Java (Dataset t) (Dataset t)

-- foreign import java unsafe sort2 :: (t <: Object) => Seq Column -> Java (Dataset t) (Dataset t)
--
-- foreign import java unsafe sort3 :: (t <: Object) => JString -> Seq JString -> Java (Dataset t) (Dataset t)

sort2 :: (t <: Object) => String -> [String] -> Java (Dataset t) (Dataset t)
sort2 t1 t2 = S.sort2 t1 (toJava $ (map toJava t2 :: [JString]))

--foreign import java unsafe sort4 :: (t <: Object) => JString -> JStringArray -> Java (Dataset t) (Dataset t)

sortWithinPartitions :: (t <: Object) => [Column] -> Java (Dataset t) (Dataset t)
sortWithinPartitions t = S.sortWithinPartitions (toJava t)

--foreign import java unsafe sortWithinPartitions :: (t <: Object) => ColumnArray -> Java (Dataset t) (Dataset t)

-- foreign import java unsafe sortWithinPartitions2 :: (t <: Object) => Seq Column -> Java (Dataset t) (Dataset t)
--
-- foreign import java unsafe sortWithinPartitions3 :: (t <: Object)
--                                                  => JString -> Seq JString -> Java (Dataset t) (Dataset t)

sortWithinPartitions2 :: (t <: Object)
                     => String -> [String] -> Java (Dataset t) (Dataset t)
sortWithinPartitions2 t1 t2 = S.sortWithinPartitions2 t1 (toJava $ (map toJava t2 :: [JString]))

-- foreign import java unsafe sortWithinPartitions4 :: (t <: Object)
--                                                  => JString -> JStringArray -> Java (Dataset t) (Dataset t)

foreign import java unsafe sparkSession :: (t <: Object) => Java (Dataset t) (SparkSession)

foreign import java unsafe sqlContext :: (t <: Object) => Java (Dataset t) (SQLContext)

foreign import java unsafe stat :: (t <: Object) => Java (Dataset t) (DataFrameStatFunctions)

foreign import java unsafe storageLevel :: (t <: Object) => Java (Dataset t) (StorageLevel)

foreign import java unsafe take :: (t <: Object) => Int -> Java (Dataset t) (Object)

foreign import java unsafe takeAsList :: (t <: Object) => Int -> Java (Dataset t) (List t)

foreign import java unsafe toDF :: (t <: Object) => Java (Dataset t) (Dataset row)

-- foreign import java unsafe toDF2 :: (t <: Object) => Seq JString -> Java (Dataset t) (Dataset row)

toDF2 :: (t <: Object) => [String] -> Java (Dataset t) (Dataset row)
toDF2 t = S.toDF2 (toJava $ (map toJava t :: [JString]))

--foreign import java unsafe toDF3 :: (t <: Object) => JStringArray -> Java (Dataset t) (Dataset row)

foreign import java unsafe toJavaRDD :: (t <: Object) => Java (Dataset t) (JavaRDD t)

foreign import java unsafe toJSON :: (t <: Object) => Java (Dataset t) (Dataset JString)

foreign import java unsafe toLocalIterator :: (t <: Object) => Java (Dataset t) (Iterator t)

foreign import java unsafe toString :: (t <: Object) => Java (Dataset t) (String)

-- foreign import java unsafe transform :: (t <: Object, u <: Object)
--                                      => Function1 (Dataset t) (Dataset u) -> Dataset u -> Java (Dataset t) (Dataset u)

foreign import java unsafe union :: (t <: Object) => Dataset t -> Java (Dataset t) (Dataset t)

foreign import java unsafe unionAll :: (t <: Object) => Dataset t -> Java (Dataset t) (Dataset t)

foreign import java unsafe unpersist :: (t <: Object) => Java (Dataset t) (Dataset t)

foreign import java unsafe unpersist2 :: (t <: Object) => Bool -> Java (Dataset t) (Dataset t)

foreign import java unsafe "where" where_ :: (t <: Object) => Column -> Java (Dataset t) (Dataset t)

foreign import java unsafe where2 :: (t <: Object) => String -> Java (Dataset t) (Dataset t)

foreign import java unsafe withColumn :: (t <: Object) => String -> Column -> Java (Dataset t) (Dataset row)

foreign import java unsafe withColumnRenamed :: (t <: Object) => String -> String -> Java (Dataset t) (Dataset row)

foreign import java unsafe withWatermark :: (t <: Object) => String -> String -> Java (Dataset t) (Dataset t)

foreign import java unsafe write :: (t <: Object) => Java (Dataset t) (DataFrameWriter t)

foreign import java unsafe writeStream :: (t <: Object) => Java (Dataset t) (DataFrameWriter t)
