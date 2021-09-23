(function(jQuery){
    
     jQuery.fn.abDegisenArkaPlan = function(veriAkisi)
     {
        var varsayilan =
        {
            resimlerArasiGecis     : 1000,
            resimEfekleri          : 1000,
            resimler               : ''
        };

        var ayarlar = jQuery.extend(varsayilan, veriAkisi);

        return this.each
        (
            function()
            {
                $obje       = $(this);
                $genislik   = $(document).width();
                $yukseklik  = $(window).height();
                var resimler = varsayilan.resimler.split(",");
                $obje.append($('<div/>').addClass('ab-resim-tasiyici-ab'));
                for(var i in resimler)
                    $('.ab-resim-tasiyici-ab').append($('<img/>', {src: resimler[i]}).addClass('abResimler-ab').css({position: 'fixed', width: $genislik, height: $yukseklik , left:0, top:0,'z-index':'-1'}).hide())
                dondur();
                setInterval(function(){dondur()},varsayilan.resimlerArasiGecis*resimler.length)
                function dondur()
                {
                    $('.ab-resim-tasiyici-ab .abResimler-ab').each(function(i) 
                    {
                        var seciliResim = $(this); 
                        setTimeout(function() 
                        {
                            $(seciliResim).prev().fadeOut(varsayilan.resimEfekleri).end().fadeIn(varsayilan.resimEfekleri).end().fadeOut(varsayilan.resimEfekleri);
                        }, varsayilan.resimlerArasiGecis*i); $(seciliResim).fadeOut()
                    });
                }
                 $(window).bind('resize',function(){
                    $('.abResimler-ab').css({
                        'width' : $(document).width(),
                        'height' : $(window).height()
                    });
                });
            }
        );
    };
})(jQuery);