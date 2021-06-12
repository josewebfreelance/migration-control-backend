using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Modelo
{
    public class valor
    {

        public int idValor { get; set; }
        public int idPrechequeo { get; set; }
        public int idTipoValor { get; set; }
        public int idTipoMoneda { get; set; }
        public int idTipoTitulo { get; set; }
        public int idTipoArticulo { get; set; }
        public decimal valor1 { get; set; }
        public int idOrigenFondos { get; set; }
        public string activo { get; set; }

        public int idUsuarioIng { get; set; }
        public DateTime fechaIng { get; set; }
        public int idUsuarioAct { get; set; }
        public DateTime fechaAct { get; set; }
    }
}
