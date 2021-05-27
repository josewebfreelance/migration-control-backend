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
    public class subTipoDoctoController : ControllerBase
    {
        public bool addsubTipoDoc([FromBody] subTipoDocto ndoc)
        {
            return subTipoDoctoData.addsubTipoDocto(ndoc);
        }
        public List<subTipoDocto> listsubTipoDoc()
        {
            return subTipoDoctoData.Listartipodocto();
        }

        public subTipoDocto obtenertID(int id)
        {
            return subTipoDoctoData.ObtenerSubtipodoscID(id);
        }
        public bool editsubtipDoc([FromBody] subTipoDocto ndoc)
        {
            return subTipoDoctoData.editsubtipoD(ndoc);
        }
        public bool delsubtipoDoc(int id)
        {
            return subTipoDoctoData.delsubtipoDoc(id);
        }
    }
}
