using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Modelo
{
    public class doctoIdentificacion
    {
        public int idtipodoc { get; set; }
        public int idsubtipodoc { get; set; }
        public string numero { get; set; }
        public DateTime fechaemision { get; set; }
        public DateTime fechavencimiento { get; set; }
        public string activo { get; set; }
        public int idUsuarioIng { get; set; }
        public DateTime fechaIng { get; set; }
        public int idUsuarioAct { get; set; }
        public DateTime fechaAct { get; set; }




    }
}
