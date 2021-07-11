<?php

/*
 * e2guardian_about.php
 *
 * part of pfSense (https://www.pfsense.org)
 * Copyright (c) 2015-2017 Marcello Coutinho
 * All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

require_once("/etc/inc/util.inc");
require_once("/etc/inc/functions.inc");
require_once("/etc/inc/pkg-utils.inc");
require_once("/etc/inc/globals.inc");
require_once("guiconfig.inc");

$pgtitle = array(gettext("5651log"), gettext("Services: Skyron"), gettext("About"));
$shortcut_section = "skyron_about";
include("head.inc");


$tab_array = array();
$tab_array[] = array(gettext("Log View"), false, "/imzalar");
$tab_array[] = array(gettext("General"), false, "/pkg_edit.php?xml=skl5651log.xml");
$tab_array[] = array(gettext("Ca Setting"), false, "/imzalar/skl5651log_camanager.php");
$tab_array[] = array(gettext("Cloud Setting"), false, "/pkg_edit.php?xml=skl5651log_cloud.xml");
$tab_array[] = array(gettext("Cron Setting"), false, "/imzalar/skl5651log_cron.php");
$tab_array[] = array(gettext("Help"), false, "/imzalar/skl5651log_about.php");

display_top_tabs($tab_array);

?>
<div class="panel panel-default">
        <div class="panel-heading"><h2 class="panel-title"><?=gettext("About Skyron 5651log"); ?></h2></div>
        <div class="panel-body">
        <div class="table-responsive">
                <table class="table table-hover table-condensed">
                                <tbody>

						<tr>
							<td width="22%" valign="top" class="vncell"><?=gettext("5651 NOLU KANUN NEDİR ?<br>

5651 sayılı kanun, İnternet ortamında yapılan yayınların düzenlenmesi ve bu yayınlar yoluyla işlenen suçlarla mücadele edilmesi i kanundur. <br>

<br>
Bu kanunun amaç ve kapsamı;<br>

İçerik Sağlayıcı,<br>
Yer Sağlayıcı,<br>
Erişim Sağlayıcı, <br>
Toplu Kullanım Sağlayıic<br>
Birimlerinin yükümlülük ve sorumluluklarının yanı sıra, İnternet ortamında işlenen belirli suçlarla bu birimler üzerinden mücade

5651 sayılı kanun toplu İnternet hizmeti sunan kurum ya da kişilere bazı sorumluluklar yüklemektedir. Bu sorumlulukların başında da loglama gelir. 

Loglama; Internet trafiginin kayıt altına alınmasıdır. 5651 sayılı kanuna göre loglama İnternet erişimi sunan kurum ya da kişilerin sundukları hizmeti kullanan kişilerin hareketlerini kaydedebileceği bir yapıdır. Bu durum, 5651 sayılı kanun ile birlikte zorunlu hale getirilmiştir. 

Loglamanın yapılmaması durumunda bu İnternet erişimi üzerinden gerçekleşen bütün işlemler hizmeti sunan kişinin sorumluluğundadır. 

5651 sayılı kanunun kapsadığı birimler herhangi bir problem ile karşılaşıldığında bu kanuna karşı bazı sorumluluklara sahiptir. Bu birimlerin detayları aşağıdaki şekilde belirtilmiştir.

Erişim Sağlayıcı: Kullanıcılarına internet ortamına erişim olanağı sağlayan her türlü gerçek veya tüzel kişiler.

İçerik Sağlayıcı: İnternet ortamı üzerinden kullanıcılara sunulan her türlü bilgi veya veriyi üreten, değiştiren ve sağlayan gerçek veya tüzel kişiler.

Yer Sağlayıcı: Hizmet ve içerikleri barındıran sistemleri sağlayan veya işleten gerçek veya tüzel kişiler.

İnternet Toplu Kullanım Sağlayıcı: Kişilere belli bir yerde ve belli bir süre internet ortamı kullanım olanağı sağlayanlar.

<br><br>
Mehmet Demir <br>
Heraklet Bilişim Teknolojileri Ltd. Şti.
<br>info@heraklet.com
<br>");?></td>
						</tr>
						</table>
				</div>
			</td>
		</tr>
	</table>
	<br>
</div>
<?php include("foot.inc"); ?>
</body>
</html>


