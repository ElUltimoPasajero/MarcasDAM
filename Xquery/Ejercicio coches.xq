
 (:for $fabricante in distinct-values(/coches/coche/fabricante)
  let $ventas := sum(/coches/coche[fabricante = $fabricante]/ventas)
  where $ventas > 2
  order by $ventas descending
  return
    <fabricante ventas="{$ventas}" nombre="{$fabricante}">
    {
      for $coche in /coches/coche[fabricante = $fabricante]
      return <modelo>{data($coche/modelo)}</modelo>
    }
    </fabricante>:)


(:==============================================================:)



 (: for $tipo in distinct-values(/coches/coche/@tipo)
  let $coche := (/coches/coche[@tipo = $tipo])[ventas = max(/coches/coche[@tipo = $tipo]/ventas)]
  return
    <top-ventas tipo="{$tipo}">
      {
        for $modelo in $coche/modelo
        return <coche decada="{$coche/@decada}" tipo="{$tipo}">
                 {$coche/fabricante}
                 {$modelo}
                 {$coche/cilindrada}
                 {$coche/velocidad_maxima}
                 {$coche/ventas}
                 {$coche/plazas}
               </coche>
      }
    </top-ventas> :)
    
    
    
    (:==============================================================:)

    
    
    
   (: let $total := (
      
      for $datos in distinct-values(//coche/@decada)
      let $total :=sum(//coche[@decada=$datos]/ventas)
      let $fabricantes := (
        for $x in distinct-values(//coche[@decada=$datos]/fabricante)
        return <fabricante>{$x}</fabricante>
        
      )
      order by $total descending
      return
      <decada decada="{$datos}" ventas="{$total}">
      {$fabricantes}
      </decada>
    )
    return $total[@ventas=max($total/@ventas)]  :)
    
    
    (:==============================================================:)

    
    
    (:let $modelos := (//coches/coche/modelo)
    
    return count ($modelos):) (:Devuelve cuandos modelos diferentes de coches hay:)
    
    (:==============================================================:)

    
 (:   let $seats := //coches/coche[fabricante = "SEAT"]
    
    return count ($seats) :) (:Devuelve todos los coches que son fabricante seat:)
    
    (:==============================================================:)

    
(:for $coche in /coches/coche
where $coche/velocidad_maxima > 150
return <coche>{$coche/modelo}</coche> :) (:Me devuelve los modelos cuya velocidad supere los 149:)

(:==============================================================:)


(:for $coche in //coches/coche
where $coche/fabricante= "SEAT" and  $coche/@tipo = "Sedán" and  $coche/velocidad_maxima < 190

   return $coche :)
   
   (:==============================================================:)

   
(:for $coche in //coches/coche[fabricante = "SEAT" and @tipo = "Deportivo"]
let $miCoche := $coche where $coche/velocidad_maxima > 150 and $coche/plazas=2 and $coche/cilindrada=1.6

return <cochePerfecto>

{$miCoche/modelo}

<tipo>{data($miCoche/@tipo)}</tipo>

<cilindrada>{data($miCoche/cilindrada)}</cilindrada>

</cochePerfecto> :) (:Me muestra un coche que sea seat, deportivo , con dos puertas, que alcance mas de 150 y con cilindrada 1.6:)

(:==============================================================:)


(:for $coches in //coches/coche where $coches/velocidad_maxima > 150

and $coches[@tipo = "Deportivo"] and $coches/plazas > 1 and string-length($coches/@tipo)>=9

return <deportivos>
<modelo>{data($coches/modelo)}</modelo>

<decada-fabricacion> {data($coches/@decada)}</decada-fabricacion>

</deportivos> :) (: Me devuelve los soches cuya velovidad maxima sea mayor que 150 cuyo tipo sea deportivo y que en el tipo deportivo el string sea igual o mayor que 9:)

(:==============================================================:)



(:let $cantidad := count(//coches/coche[velocidad_maxima > 150])

return $cantidad :) (: Me devuelve la suma de todos los coches que corren mas de 150:)

    (:==============================================================:)

    
  (:for $Fabricantes in distinct-values (//coches/coche/fabricante)
  
  let $ventasFabricante := sum(//coches/coche[fabricante = $Fabricantes]/ventas)
  
  order by $ventasFabricante descending
  
  return   <Fabricante ventasTotales="{$ventasFabricante}" >{data($Fabricantes)}</Fabricante> :)
  
  (:==============================================================:)

  

(: for $coches in distinct-values (//coches/coche/@tipo)

let $masVendido := (//coches/coche[@tipo=$coches])[ventas= max(//coches/coche[@tipo=$coches]/ventas)]

order by $masVendido/ventas descending

return 

<top-ventas tipo="{$coches}">
<coche decada="{$masVendido/@decada}" tipo="{$coches}"></coche>
<fabricante>{data($masVendido/fabricante)}</fabricante>
<modelo>{data($masVendido/modelo)}</modelo>
<cilindrada>{data($masVendido/cilindrada)}</cilindrada>
<velocidad_maxima>{data($masVendido/velocidad_maxima)}</velocidad_maxima>
<ventas>{data($masVendido/ventas)}</ventas>
<plazas>{data($masVendido/plazas)}</plazas>

</top-ventas> :)

(:==============================================================:)


(:for $coche in //coches/coche
let $tipo := $coche/@tipo
group by $tipo
return <tipo-coche tipo="{$tipo}">{count($coche)}</tipo-coche> :)


(:Devuelve el tipo de coche y cuantos:)

(:==============================================================:)

(:for $coche in //coches/coche
let $decada := $coche/@decada
group by $decada
return <coche decada="{$decada}">{count($coche)}</coche> :)

(:Devuelve la decada del coche y cuando hay de la misma decada:)

(:==============================================================:)



(:let $cocheVelocidad := //coches/coche[velocidad_maxima>150]



return count($cocheVelocidad) :)

(:Me suma los coches cuya velocidad maxima sea mayor de 150:)

(:==============================================================:)


(:for $tipo in distinct-values (//coches/coche/@tipo)

let $ventas := /coches/coche[@tipo = $tipo][ventas = max(/coches/coche[@tipo = $tipo]/ventas)]


return $ventas :)

(:==============================================================:)

(:let $coches := //coches/coche

for $orden in $coches

order by $orden/velocidad_maxima descending


return $orden :) 

 (:Coches ordenador por velocidad maxima de mayor a menor:)

(:==============================================================:)


(:let $coches := //coches/coche

let $masRapidos := $coches[velocidad_maxima >300]

return $masRapidos :)

(:==============================================================:)


(:let $deportivos := //coches/coche[@tipo="Deportivo"]

let $suma := sum($deportivos/ventas) 

return $suma :)  (:Me devuelve la suma de las ventas de los deportivos:)


(:==============================================================:)


(:let $deportivos := //coches/coche[@tipo="Deportivo"and velocidad_maxima>190]

let $suma := sum($deportivos/ventas) 

return $suma  :)


for $fabricante in distinct-values (//coches/coche/fabricante)

let $ventas := sum(//coches/coche[fabricante=$fabricante]/ventas)

order by $ventas descending

return <fabricante nombre="{$fabricante}">Ventas={data($ventas)}</fabricante>




