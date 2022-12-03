package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.management.StandardEmitterMBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class BoardDAO {

    @Autowired
    JdbcTemplate jdbcTemplate;

    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template){
        this.jdbcTemplate = template;
    }
    private final String BOARD_INSERT = "insert into BOARD (id, password, nickname, age,phoneNum,email,address,gender) values (?,?,?,?,?,?,?,?)";
    private final String BOARD_UPDATE = "update BOARD set id=?, password=?, nickname=?, age=?, phoneNum=?, email=?, address=?,gender=? where seq=?";
    private final String BOARD_DELETE = "delete from BOARD where seq=?";
    private final String BOARD_GET = "select * from BOARD where seq=?";
    private final String BOARD_LIST = "select * from BOARD order by seq desc";


    public int insertBoard(BoardVO vo){
        return jdbcTemplate.update(BOARD_INSERT, new Object[]{vo.getId(), vo.getPassword(), vo.getNickname(), vo.getAge(), vo.getPhoneNum(), vo.getEmail(), vo.getAddress(), vo.getGender()});
    }

    public int deleteBoard(int id){
        return jdbcTemplate.update(BOARD_DELETE, new Object[]{id});
    }

    public int updateBoard(BoardVO vo){
        return jdbcTemplate.update(BOARD_UPDATE, new Object[]{vo.getId(), vo.getPassword(), vo.getNickname(), vo.getAge(), vo.getPhoneNum(), vo.getEmail(), vo.getAddress(), vo.getGender(), vo.getSeq()});
    }

    public BoardVO getBoard(int seq){
        return jdbcTemplate.queryForObject(BOARD_GET, new Object[] {seq}, new BeanPropertyRowMapper<BoardVO>(BoardVO.class));
    }

    public List<BoardVO> getBoardList(){
//        String sql = "select * from BOARD order by regdate desc";
        return jdbcTemplate.query(BOARD_LIST, new RowMapper<BoardVO>() {
            @Override
            public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                BoardVO data = new BoardVO();
                data.setSeq(rs.getInt("seq"));
                data.setId(rs.getString("id"));
                data.setPassword(rs.getString("password"));
                data.setNickname(rs.getString("nickname"));
                data.setAge(rs.getString("age"));
                data.setPhoneNum(rs.getString("phoneNum"));
                data.setEmail(rs.getString("email"));
                data.setAddress(rs.getString("address"));
                data.setGender(rs.getString("gender"));
                data.setRegdate(rs.getDate("regdate"));
                return data;
            }
        });
    }
}