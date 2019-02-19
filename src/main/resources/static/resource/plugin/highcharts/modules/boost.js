(function(g,p){function x(a,c,b,d,i){i=i||0;d=d||y;m(a.slice(i,i+d),c);i+d<a.length?setTimeout(function(){x(a,c,b,d,i+d)}):b&&b()}var O=function(){},P=g.Color,l=g.Series,e=g.seriesTypes,m=g.each,s=g.extend,Q=p.addEvent,R=p.fireEvent,S=g.merge,T=g.pick,k=g.wrap,q=g.getOptions().plotOptions,y=5E4;m(["area","arearange","column","line","scatter"],function(a){if(q[a])q[a].boostThreshold=5E3});m(["translate","generatePoints","drawTracker","drawPoints","render"],function(a){function c(b){var c=this.options.stacking&&
(a==="translate"||a==="generatePoints");if((this.processedXData||this.options.data).length<(this.options.boostThreshold||Number.MAX_VALUE)||c){if(a==="render"&&this.image)this.image.attr({href:""}),this.animate=null;b.call(this)}else if(this[a+"Canvas"])this[a+"Canvas"]()}k(l.prototype,a,c);a==="translate"&&(e.column&&k(e.column.prototype,a,c),e.arearange&&k(e.arearange.prototype,a,c))});k(l.prototype,"getExtremes",function(a){this.hasExtremes()||a.apply(this,Array.prototype.slice.call(arguments,
1))});k(l.prototype,"setData",function(a){this.hasExtremes(!0)||a.apply(this,Array.prototype.slice.call(arguments,1))});k(l.prototype,"processData",function(a){this.hasExtremes(!0)||a.apply(this,Array.prototype.slice.call(arguments,1))});g.extend(l.prototype,{pointRange:0,hasExtremes:function(a){var c=this.options,b=this.xAxis.options,d=this.yAxis.options;return c.data.length>(c.boostThreshold||Number.MAX_VALUE)&&typeof d.min==="number"&&typeof d.max==="number"&&(!a||typeof b.min==="number"&&typeof b.max===
"number")},destroyGraphics:function(){var a=this,c=this.points,b,d;for(d=0;d<c.length;d+=1)if((b=c[d])&&b.graphic)b.graphic=b.graphic.destroy();m(["graph","area"],function(b){a[b]&&(a[b]=a[b].destroy())})},getContext:function(){var a=this.chart.plotWidth,c=this.chart.plotHeight;this.canvas?this.ctx.clearRect(0,0,a,c):(this.canvas=document.createElement("canvas"),this.image=this.chart.renderer.image("",0,0,a,c).add(this.group),this.ctx=this.canvas.getContext("2d"));this.canvas.setAttribute("width",
a);this.canvas.setAttribute("height",c);this.image.attr({width:a,height:c});return this.ctx},canvasToSVG:function(){this.image.attr({href:this.canvas.toDataURL("image/png")})},cvsLineTo:function(a,c,b){a.lineTo(c,b)},renderCanvas:function(){var a=this,c=a.options,b=a.chart,d=this.xAxis,i=this.yAxis,h,g,e=0,k=a.processedXData,l=a.processedYData,m=c.data,j=d.getExtremes(),p=j.min,q=j.max,j=i.getExtremes(),U=j.min,V=j.max,z={},t,W=!!a.sampling,A,B=c.marker&&c.marker.radius,C=this.cvsDrawPoint,D=c.lineWidth?
this.cvsLineTo:!1,E=B<=1?this.cvsMarkerSquare:this.cvsMarkerCircle,X=c.enableMouseTracking!==!1,F,j=c.threshold,n=i.getThreshold(j),G=typeof j==="number",H=n,Y=this.fill,I=a.pointArrayMap&&a.pointArrayMap.join(",")==="low,high",J=!!c.stacking,Z=a.cropStart||0,j=b.options.loading,$=a.requireSorting,K,aa=c.connectNulls,L=!k,u,v,o,r,ba=a.fillOpacity?(new P(a.color)).setOpacity(T(c.fillOpacity,0.75)).get():a.color,M=function(){Y?(h.fillStyle=ba,h.fill()):(h.strokeStyle=a.color,h.lineWidth=c.lineWidth,
h.stroke())},N=function(a,b,c){e===0&&h.beginPath();K?h.moveTo(a,b):C?C(h,a,b,c,F):D?D(h,a,b):E&&E(h,a,b,B);e+=1;e===1E3&&(M(),e=0);F={clientX:a,plotY:b,yBottom:c}},w=function(a,b,c){X&&!z[a+","+b]&&(A.push({clientX:a,plotX:a,plotY:b,i:Z+c}),z[a+","+b]=!0)};this.points&&this.destroyGraphics();a.plotGroup("group","series",a.visible?"visible":"hidden",c.zIndex,b.seriesGroup);a.getAttribs();a.markerGroup=a.group;Q(a,"destroy",function(){a.markerGroup=null});A=this.points=[];h=this.getContext();a.buildKDTree=
O;if(m.length>99999)b.options.loading=S(j,{labelStyle:{backgroundColor:"rgba(255,255,255,0.75)",padding:"1em",borderRadius:"0.5em"},style:{backgroundColor:"none",opacity:1}}),b.showLoading("Drawing..."),b.options.loading=j,b.loadingShown===!0?b.loadingShown=1:b.loadingShown+=1;g=0;x(J?a.data:k||m,function(b){var c,f,e,h=!0;L?(c=b[0],f=b[1]):(c=b,f=l[g]);if(I)L&&(f=b.slice(1,3)),e=f[0],f=f[1];else if(J)c=b.x,f=b.stackY,e=f-b.y;b=f===null;$||(h=f>=U&&f<=V);if(!b&&c>=p&&c<=q&&h)if(c=Math.round(d.toPixels(c,
!0)),W){if(o===void 0||c===t){I||(e=f);if(r===void 0||f>v)v=f,r=g;if(o===void 0||e<u)u=e,o=g}c!==t&&(o!==void 0&&(f=i.toPixels(v,!0),n=i.toPixels(u,!0),N(c,G?Math.min(f,H):f,G?Math.max(n,H):n),w(c,f,r),n!==f&&w(c,n,o)),o=r=void 0,t=c)}else f=Math.round(i.toPixels(f,!0)),N(c,f,n),w(c,f,g);K=b&&!aa;g+=1;g%y===0&&a.canvasToSVG()},function(){var c=b.loadingDiv,d=+b.loadingShown;M();a.canvasToSVG();R(a,"renderedCanvas");if(d===1)s(c.style,{transition:"opacity 250ms",opacity:0}),b.loadingShown=!1,setTimeout(function(){c.parentNode&&
c.parentNode.removeChild(c);b.loadingDiv=b.loadingSpan=null},250);if(d)b.loadingShown=d-1;a.directTouch=!1;a.options.stickyTracking=!0;delete a.buildKDTree;a.buildKDTree()},b.renderer.forExport?Number.MAX_VALUE:void 0)}});e.scatter.prototype.cvsMarkerCircle=function(a,c,b,d){a.moveTo(c,b);a.arc(c,b,d,0,2*Math.PI,!1)};e.scatter.prototype.cvsMarkerSquare=function(a,c,b,d){a.moveTo(c,b);a.rect(c-d,b-d,d*2,d*2)};e.scatter.prototype.fill=!0;s(e.area.prototype,{cvsDrawPoint:function(a,c,b,d,e){e&&c!==e.clientX&&
(a.moveTo(e.clientX,e.yBottom),a.lineTo(e.clientX,e.plotY),a.lineTo(c,b),a.lineTo(c,d))},fill:!0,fillOpacity:!0,sampling:!0});s(e.column.prototype,{cvsDrawPoint:function(a,c,b,d){a.rect(c-1,b,1,d-b)},fill:!0,sampling:!0});k(l.prototype,"searchPoint",function(a,c){var b=a.call(this,c),d=b;if(b&&!(b instanceof this.pointClass))d=(new this.pointClass).init(this,this.options.data[b.i]),d.dist=b.dist,d.category=d.x,d.plotX=b.plotX,d.plotY=b.plotY;return d})})(Highcharts,HighchartsAdapter);