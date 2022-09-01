module DoctorHelper
  FIND_FREE = <<-SQL
  SELECT *
  FROM
    ( SELECT d.*,
             r.count_of_patient
     FROM doctors d
     JOIN
       ( SELECT doctor_id ,
                count(id) count_of_patient
        FROM receptions
        GROUP BY doctor_id ) r ON d.id = r.doctor_id
     GROUP BY d.id)
  WHERE count_of_patient < ?;
  SQL

end
