BEGIN TRANSACTION 

      BEGIN try 
         
          --INSERT, UPDATE, DELETE

          SELECT @@rowcount AS result; 

          COMMIT TRANSACTION; 
      END try 

      BEGIN catch 
          ROLLBACK TRANSACTION; 

          SELECT @@rowcount AS result,
          error_message() AS error; 
      END catch; 
