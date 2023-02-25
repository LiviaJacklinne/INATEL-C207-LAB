import DAO.InstrumentoDAO;
import MODEL.Instrumento;

import java.time.chrono.IsoChronology;

public class Main
{
        public static void main(String[] args)
        {
            InstrumentoDAO iDAO = new InstrumentoDAO();
            Instrumento i1 = new Instrumento();
            i1.nome = "Violao";
            i1.editora = "Fender";
            i1.ano = 2;
            Instrumento i2 = new Instrumento();
            i2.nome = "Piano";
            i2.editora = "Top";
            i2.ano = 200;

            Instrumento i3 = new Instrumento();
            i3.nome = "Bateria";
            i3.editora = "Boa";
            i3.ano = 1;

            iDAO.inserirInstrumento(i1);
            iDAO.inserirInstrumento(i2);
            //iDAO.atualizarInstrumento(1,i3);
            //iDAO.deletarInstrumento(1);
        }
}
