using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Modelo
{
    public class prechequeo
    {
        


        public int idPrechequeo { get; set; }
        public int idDoctoPersona { get; set; }
        public string codigo { get; set; }
        public DateTime fecha { get; set; }
        public int idDelegacion { get; set; }
        public int idTipoMovimiento { get; set; }
        public DateTime fechaLlegada { get; set; }
        public DateTime fechaSalida { get; set; }
        public int idTipoViaje { get; set; }
        public int idRuta { get; set; }
        public int idPaisOrigen { get; set; }
        public int idPaisDestino { get; set; }
        public string placaVehiculo { get; set; }
        public string dineroMayorLimite { get; set; }
        public string autorizaCompartir { get; set; }
        public string aurtorizaVerificar { get; set; }
        public int idLimiteDinero { get; set; }
        public string llaveCifrada { get; set; }
        public string qr { get; set; }
        public string ip { get; set; }
        public string activo { get; set; }
        public int idUsuarioIng { get; set; }
        public DateTime fechaIng { get; set; }
        public int idUsuarioAct { get; set; }
        public DateTime fechaAct { get; set; }

    }
}
