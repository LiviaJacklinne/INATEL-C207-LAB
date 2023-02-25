package DAO;

import MODEL.Instrumento;
import java.sql.SQLException;

public class InstrumentoDAO extends ConnectionDAO
{
    //DAO - Data Access Object
    boolean sucesso = false; //Para saber se funcionou

    public boolean inserirInstrumento(Instrumento instrumento)
    {
        connectToDB();
        String sql = "INSERT INTO livro (nome,editora,ano) values(?,?,?)";

        try
        {
            pst = con.prepareStatement(sql);
            pst.setString(1, instrumento.nome);
            pst.setString(2, instrumento.editora);
            pst.setInt(3, instrumento.ano);
            pst.execute();
            sucesso = true;
        }
        catch(SQLException exc)
        {
            System.out.println("Erro: " + exc.getMessage());
            sucesso = false;
        }
        finally
        {
            try
            {
                con.close();
                pst.close();
            } catch(SQLException exc)
            {
                System.out.println("Erro: " + exc.getMessage());
            }
        }

        return sucesso;
    }

    public boolean atualizarInstrumento(int id, Instrumento instrumento) {
        connectToDB();
        String sql = "UPDATE livro SET nome=?, editora=?, ano=? where id=?";

        try
        {
            pst = con.prepareStatement(sql);
            pst.setString(1, instrumento.nome);
            pst.setString(2, instrumento.editora);
            pst.setInt(3, instrumento.ano);
            pst.setInt(4, id);
            pst.execute();
            sucesso = true;
        }
        catch(SQLException ex)
        {
            System.out.println("Erro = " +  ex.getMessage());
            sucesso = false;
        }
        finally
        {
            try
            {
                con.close();
                pst.close();
            }
            catch(SQLException exc)
            {
                System.out.println("Erro: " + exc.getMessage());
            }
        }
        return sucesso;
    }

    public boolean deletarInstrumento(int id) {
        connectToDB();
        String sql = "DELETE FROM livro where id=?";

        try
        {
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.execute();
            sucesso = true;
        }
        catch(SQLException ex)
        {
            System.out.println("Erro = " +  ex.getMessage());
            sucesso = false;
        }
        finally
        {
            try
            {
                con.close();
                pst.close();
            }
            catch(SQLException exc)
            {
                System.out.println("Erro: " + exc.getMessage());
            }
        }
        return sucesso;
    }
}

