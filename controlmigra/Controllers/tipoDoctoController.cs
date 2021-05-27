using controlmigra.Data;
using controlmigra.Modelo;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Controllers
{
    
    [ApiController]
    [Route("api/[action]/{id?}")]
    public class tipoDoctoController : ControllerBase
    {
        public bool addtdoc([FromBody] tipoDocto ndoc)
        {
            return tipoDoctoData.addTipoDocto(ndoc);
        }
        public List<tipoDocto> listtdoc()
        {
            return tipoDoctoData.Listartipodocto();
        }

        public tipoDocto obtenerTipDoc(int id)
        {
            return tipoDoctoData.ObtenertdocID (id);
        }
        public bool editiDoc([FromBody] tipoDocto ndoc)
        {
            return tipoDoctoData.edittiDoc(ndoc);
        }
        public bool deltiDoc(int id)
        {
            return tipoDoctoData.deltiDoc(id);
        }
    }
}
