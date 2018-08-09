package stcs.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import stcs.model.Sentence;
import stcs.model.SentenceExample;

public interface SentenceMapper {
    long countByExample(SentenceExample example);

    int deleteByExample(SentenceExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Sentence record);

    int insertSelective(Sentence record);
    //已添加了分页功能，只要Example.setStartRow()和.setPageSize
    List<Sentence> selectByExample(SentenceExample example);
    //自建
    Sentence selectByPrimaryKey(Integer id);
    //自建
    List<Integer> selectAllPrimaryKeys();

    int updateByExampleSelective(@Param("record") Sentence record, @Param("example") SentenceExample example);

    int updateByExample(@Param("record") Sentence record, @Param("example") SentenceExample example);

    int updateByPrimaryKeySelective(Sentence record);

    int updateByPrimaryKey(Sentence record);
}