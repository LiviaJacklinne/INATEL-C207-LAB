import DAO.InstrumentoDAO;
import MODEL.Instrumento;

import java.time.chrono.IsoChronology;

public class Main
{
    public static void main(String[] args)
    {
        InstrumentoDAO iDAO = new InstrumentoDAO();
        Instrumento i1 = new Instrumento();
        i1.nome = "A Cabana";
        i1.editora = "Cultura";
        i1.ano = 2;
        Instrumento i2 = new Instrumento();
        i2.nome = "Clube dos 5";
        i2.editora = "Master";
        i2.ano = 10;

       /* Instrumento i3 = new Instrumento();
        i3.nome = "Cidade de papel";
        i3.editora = "Livre";
        i3.ano = 7;*/

        iDAO.inserirInstrumento(i1);
        iDAO.inserirInstrumento(i2);
        //iDAO.atualizarInstrumento(1,i3);
        //iDAO.deletarInstrumento(1);
    }
}
