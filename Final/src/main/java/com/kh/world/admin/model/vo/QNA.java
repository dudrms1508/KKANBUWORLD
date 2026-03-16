package com.kh.world.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QNA {
   private int no;
   private int userNo;
   private String userId;
   private String title;
   private String email;
   private String category;
   private String content;
   private Date q_Date;
   private String answer;
   private String status;
   private Date a_Date;
//   private QNA_Category category;
   
}