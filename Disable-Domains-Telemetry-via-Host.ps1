
# This script blocks telemetry related domains via the hosts file and related IPs via Windows Firewall.

# Entries related to Akamai have been reported to cause issues with Widevine DRM. C:\Windows\System32\drivers\etc

$hosts_file = "$env:systemroot\System32\drivers\etc\hosts" 
$domains = @(
    "184-86-53-99.deploy.static.akamaitechnologies.com"
    "a-0001.a-msedge.net"
    "a-0002.a-msedge.net"
    "a-0003.a-msedge.net"
    "a-0004.a-msedge.net"
    "a-0005.a-msedge.net"
    "a-0006.a-msedge.net"
    "a-0007.a-msedge.net"
    "a-0008.a-msedge.net"
    "a-0009.a-msedge.net"
    "a1621.g.akamai.net"
    "a1856.g2.akamai.net"
    "a1961.g.akamai.net"
    "a248.e.akamai.net"   # makes iTunes download button disappear (#43)
    "a978.i6g1.akamai.net"
    "a.ads1.msn.com"
    "a.ads2.msads.net"
    "a.ads2.msn.com"
    "ac3.msn.com"
    "ad.doubleclick.net"
    "adnexus.net"
    "adnxs.com"
    "ads1.msads.net"
    "ads1.msn.com"
    "ads.msn.com"
    "aidps.atdmt.com"
    "aka-cdn-ns.adtech.de"
    "a-msedge.net"
    "any.edge.bing.com"
    "a.rad.msn.com"
    "az361816.vo.msecnd.net"
    "az512334.vo.msecnd.net"
    "b.ads1.msn.com"
    "b.ads2.msads.net"
    "bingads.microsoft.com"
    "b.rad.msn.com"
    "bs.serving-sys.com"
    "c.atdmt.com"
    "cdn.atdmt.com"
    "cds26.ams9.msecn.net"
    "choice.microsoft.com"
    "choice.microsoft.com.nsatc.net"
    "compatexchange.cloudapp.net"
    "corpext.msitadfs.glbdns2.microsoft.com"
    "corp.sts.microsoft.com"
    "cs1.wpc.v0cdn.net"
    "db3aqu.atdmt.com"
    "df.telemetry.microsoft.com"
    "diagnostics.support.microsoft.com"
    "e2835.dspb.akamaiedge.net"
    "e7341.g.akamaiedge.net"
    "e7502.ce.akamaiedge.net"
    "e8218.ce.akamaiedge.net"
    "ec.atdmt.com"
    "fe2.update.microsoft.com.akadns.net"
    "feedback.microsoft-hohm.com"
    "feedback.search.microsoft.com"
    "feedback.windows.com"
    "flex.msn.com"
    "g.msn.com"
    "h1.msn.com"
    "h2.msn.com"
    "hostedocsp.globalsign.com"
    "i1.services.social.microsoft.com"
    "i1.services.social.microsoft.com.nsatc.net"
    #"ipv6.msftncsi.com"                    # Issues may arise where Windows 10 thinks it doesn't have internet
    #"ipv6.msftncsi.com.edgesuite.net"      # Issues may arise where Windows 10 thinks it doesn't have internet
    "lb1.www.ms.akadns.net"
    "live.rads.msn.com"
    "m.adnxs.com"
    "msedge.net"
    #"msftncsi.com"
    "msnbot-65-55-108-23.search.msn.com"
    "msntest.serving-sys.com"
    "oca.telemetry.microsoft.com"
    "oca.telemetry.microsoft.com.nsatc.net"
    "onesettings-db5.metron.live.nsatc.net"
    "pre.footprintpredict.com"
    "preview.msn.com"
    "rad.live.com"
    "rad.msn.com"
    "redir.metaservices.microsoft.com"
    "reports.wes.df.telemetry.microsoft.com"
    "schemas.microsoft.akadns.net"
    "secure.adnxs.com"
    "secure.flashtalking.com"
    "services.wes.df.telemetry.microsoft.com"
    "settings-sandbox.data.microsoft.com"
    #"settings-win.data.microsoft.com"       # may cause issues with Windows Updates
    "sls.update.microsoft.com.akadns.net"
    #"sls.update.microsoft.com.nsatc.net"    # may cause issues with Windows Updates
    "sqm.df.telemetry.microsoft.com"
    "sqm.telemetry.microsoft.com"
    "sqm.telemetry.microsoft.com.nsatc.net"
    "ssw.live.com"
    "static.2mdn.net"
    "statsfe1.ws.microsoft.com"
    "statsfe2.update.microsoft.com.akadns.net"
    "statsfe2.ws.microsoft.com"
    "survey.watson.microsoft.com"
    "telecommand.telemetry.microsoft.com"
    "telecommand.telemetry.microsoft.com.nsatc.net"
    "telemetry.appex.bing.net"
    "telemetry.microsoft.com"
    "telemetry.urs.microsoft.com"
    "vortex-bn2.metron.live.com.nsatc.net"
    "vortex-cy2.metron.live.com.nsatc.net"
    "vortex.data.microsoft.com"
    "vortex-sandbox.data.microsoft.com"
    "vortex-win.data.microsoft.com"
    "cy2.vortex.data.microsoft.com.akadns.net"
    "watson.live.com"
    "watson.microsoft.com"
    "watson.ppe.telemetry.microsoft.com"
    "watson.telemetry.microsoft.com"
    "watson.telemetry.microsoft.com.nsatc.net"
    "wes.df.telemetry.microsoft.com"
    "win10.ipv6.microsoft.com"
    "www.bingads.microsoft.com"
    "www.go.microsoft.akadns.net"
    #"www.msftncsi.com"                         # Issues may arise where Windows 10 thinks it doesn't have internet
    "client.wns.windows.com"
    #"wdcp.microsoft.com"                       # may cause issues with Windows Defender Cloud-based protection
    #"dns.msftncsi.com"                         # This causes Windows to think it doesn't have internet
    #"storeedgefd.dsx.mp.microsoft.com"         # breaks Windows Store
    "wdcpalt.microsoft.com"
    "settings-ssl.xboxlive.com"
    "settings-ssl.xboxlive.com-c.edgekey.net"
    "settings-ssl.xboxlive.com-c.edgekey.net.globalredir.akadns.net"
    "e87.dspb.akamaidege.net"
    "insiderservice.microsoft.com"
    "insiderservice.trafficmanager.net"
    "e3843.g.akamaiedge.net"
    "flightingserviceweurope.cloudapp.net"
    #"sls.update.microsoft.com"                 # may cause issues with Windows Updates
    "static.ads-twitter.com"                    # may cause issues with Twitter login
    "www-google-analytics.l.google.com"
    "p.static.ads-twitter.com"                  # may cause issues with Twitter login
    "hubspot.net.edge.net"
    "e9483.a.akamaiedge.net"

    "www.google-analytics.com"
    "padgead2.googlesyndication.com"
    "mirror1.malwaredomains.com"
    "mirror.cedia.org.ec"
    "stats.g.doubleclick.net"
    "stats.l.doubleclick.net"
    "adservice.google.de"
    "adservice.google.com"
    "googleads.g.doubleclick.net"
    "pagead46.l.doubleclick.net"
    "hubspot.net.edgekey.net"
    "insiderppe.cloudapp.net"                   # Feedback-Hub
    "livetileedge.dsx.mp.microsoft.com"

    # Extra
    "fe2.update.microsoft.com.akadns.net"
    "s0.2mdn.net"
    "statsfe2.update.microsoft.com.akadns.net"
    "survey.watson.microsoft.com"
    "view.atdmt.com"
    "watson.microsoft.com"
    "watson.ppe.telemetry.microsoft.com"
    "watson.telemetry.microsoft.com"
    "watson.telemetry.microsoft.com.nsatc.net"
    "wes.df.telemetry.microsoft.com"
    "m.hotmail.com"

    # can cause issues with Skype (#79) or other services (#171)
    #"apps.skype.com"
    #"c.msn.com"
    # "login.live.com"                  # prevents login to outlook and other live apps
    #"pricelist.skype.com"
    #"s.gateway.messenger.live.com"
    #"ui.skype.com"
    
    
    # Adobe
  "activation.cloud.techsmith.com"
  "oscount.techsmith.com"
  "3dns.adobe.com"
  "3dns-1.adobe.com"
  "3dns-2.adobe.com"
  "3dns-3.adobe.com"
  "3dns-4.adobe.com"
  "3dns-5.adobe.com"
  "activate.adobe.com"
  "activate.wip1.adobe.com"
  "activate.wip2.adobe.com"
  "activate.wip3.adobe.com"
  "activate.wip4.adobe.com"
  "activate-sea.adobe.com"
  "activate-sjc0.adobe.com"
  "adobe-dns.adobe.com"
  "adobe-dns-1.adobe.com"
  "adobe-dns-2.adobe.com"
  "adobe-dns-3.adobe.com"
  "adobe-dns-4.adobe.com"
  "adobeereg.com"
  "ereg.adobe.com"
  "ereg.wip.adobe.com"
  "ereg.wip1.adobe.com"
  "ereg.wip2.adobe.com"
  "ereg.wip3.adobe.com"
  "ereg.wip4.adobe.com"
  "hl2rcv.adobe.com"
  "practivate.adobe"
  "practivate.adobe.com"
  "practivate.adobe.ipp"
  "practivate.adobe.newoa"
  "practivate.adobe.ntp"
  "wip.adobe.com"
  "wip1.adobe.com"
  "wip2.adobe.com"
  "wip3.adobe.com"
  "wip4.adobe.com"
  "wwis-dubc1-vip100.adobe.com"
  "wwis-dubc1-vip101.adobe.com"
  "wwis-dubc1-vip102.adobe.com"
  "wwis-dubc1-vip103.adobe.com"
  "wwis-dubc1-vip104.adobe.com"
  "wwis-dubc1-vip105.adobe.com"
  "wwis-dubc1-vip106.adobe.com"
  "wwis-dubc1-vip107.adobe.com"
  "wwis-dubc1-vip108.adobe.com"
  "wwis-dubc1-vip109.adobe.com"
  "wwis-dubc1-vip110.adobe.com"
  "wwis-dubc1-vip111.adobe.com"
  "wwis-dubc1-vip112.adobe.com"
  "wwis-dubc1-vip113.adobe.com"
  "wwis-dubc1-vip114.adobe.com"
  "wwis-dubc1-vip115.adobe.com"
  "wwis-dubc1-vip116.adobe.com"
  "wwis-dubc1-vip117.adobe.com"
  "wwis-dubc1-vip118.adobe.com"
  "wwis-dubc1-vip119.adobe.com"
  "wwis-dubc1-vip120.adobe.com"
  "wwis-dubc1-vip121.adobe.com"
  "wwis-dubc1-vip122.adobe.com"
  "wwis-dubc1-vip123.adobe.com"
  "wwis-dubc1-vip124.adobe.com"
  "wwis-dubc1-vip125.adobe.com"
  "wwis-dubc1-vip30.adobe.com"
  "wwis-dubc1-vip31.adobe.com"
  "wwis-dubc1-vip32.adobe.com"
  "wwis-dubc1-vip33.adobe.com"
  "wwis-dubc1-vip34.adobe.com"
  "wwis-dubc1-vip35.adobe.com"
  "wwis-dubc1-vip36.adobe.com"
  "wwis-dubc1-vip37.adobe.com"
  "wwis-dubc1-vip38.adobe.com"
  "wwis-dubc1-vip39.adobe.com"
  "wwis-dubc1-vip40.adobe.com"
  "wwis-dubc1-vip41.adobe.com"
  "wwis-dubc1-vip42.adobe.com"
  "wwis-dubc1-vip43.adobe.com"
  "wwis-dubc1-vip44.adobe.com"
  "wwis-dubc1-vip45.adobe.com"
  "wwis-dubc1-vip46.adobe.com"
  "wwis-dubc1-vip47.adobe.com"
  "wwis-dubc1-vip48.adobe.com"
  "wwis-dubc1-vip49.adobe.com"
  "wwis-dubc1-vip50.adobe.com"
  "wwis-dubc1-vip51.adobe.com"
  "wwis-dubc1-vip52.adobe.com"
  "wwis-dubc1-vip53.adobe.com"
  "wwis-dubc1-vip54.adobe.com"
  "wwis-dubc1-vip55.adobe.com"
  "wwis-dubc1-vip56.adobe.com"
  "wwis-dubc1-vip57.adobe.com"
  "wwis-dubc1-vip58.adobe.com"
  "wwis-dubc1-vip59.adobe.com"
  "wwis-dubc1-vip60.adobe.com"
  "wwis-dubc1-vip60.adobe.com"
  "wwis-dubc1-vip60.adobe.com"
  "wwis-dubc1-vip61.adobe.com"
  "wwis-dubc1-vip62.adobe.com"
  "wwis-dubc1-vip63.adobe.com"
  "wwis-dubc1-vip64.adobe.com"
  "wwis-dubc1-vip65.adobe.com"
  "wwis-dubc1-vip66.adobe.com"
  "wwis-dubc1-vip67.adobe.com"
  "wwis-dubc1-vip68.adobe.com"
  "wwis-dubc1-vip69.adobe.com"
  "wwis-dubc1-vip70.adobe.com"
  "wwis-dubc1-vip71.adobe.com"
  "wwis-dubc1-vip72.adobe.com"
  "wwis-dubc1-vip73.adobe.com"
  "wwis-dubc1-vip74.adobe.com"
  "wwis-dubc1-vip75.adobe.com"
  "wwis-dubc1-vip76.adobe.com"
  "wwis-dubc1-vip77.adobe.com"
  "wwis-dubc1-vip78.adobe.com"
  "wwis-dubc1-vip79.adobe.com"
  "wwis-dubc1-vip80.adobe.com"
  "wwis-dubc1-vip81.adobe.com"
  "wwis-dubc1-vip82.adobe.com"
  "wwis-dubc1-vip83.adobe.com"
  "wwis-dubc1-vip84.adobe.com"
  "wwis-dubc1-vip85.adobe.com"
  "wwis-dubc1-vip86.adobe.com"
  "wwis-dubc1-vip87.adobe.com"
  "wwis-dubc1-vip88.adobe.com"
  "wwis-dubc1-vip89.adobe.com"
  "wwis-dubc1-vip90.adobe.com"
  "wwis-dubc1-vip91.adobe.com"
  "wwis-dubc1-vip92.adobe.com"
  "wwis-dubc1-vip93.adobe.com"
  "wwis-dubc1-vip94.adobe.com"
  "wwis-dubc1-vip95.adobe.com"
  "wwis-dubc1-vip96.adobe.com"
  "wwis-dubc1-vip97.adobe.com"
  "wwis-dubc1-vip98.adobe.com"
  "wwis-dubc1-vip99.adobe.com"
  "crl.versign.net"
  "ood.opsource.net"

# Corel
"www.mc.corel.com"
  "mc.corel.com"
  "www.apps.corel.com"
  "apps.corel.com"
  "www.origin-mc.corel.com"
  "origin-mc.corel.com"
  "www.iws.corel.com"
  "iws.corel.com"
  "www.compute-1.amazonaws.com"
  "compute-1.amazonaws.com"
  "www.ipm.corel.com"
  "ipm.corel.com"
  "www.dev1.ipm.corel.public.corel.net"
  "dev1.ipm.corel.public.corel.net"

#Iplogger
  "ezstat.ru"
  "iplogger.org"
  "2no.co"
  "iplogger.com"
  "iplogger.ru"
  "yip.su"
  "iplogger.co"
  "iplogger.info"
  "ipgrabber.ru"
  "ipgraber.ru"
  "iplis.ru"
  "02ip.ru"
)
Write-Output "" | Out-File -Encoding ASCII -Append $hosts_file
foreach ($domain in $domains) {
    if (-Not (Select-String -Path $hosts_file -Pattern $domain)) {
        Write-Output "0.0.0.0 $domain" | Out-File -Encoding ASCII -Append $hosts_file
    }
}

















































































