<template>
    <footer class="footer">
        <section class="footer-up">
            <footer-content></footer-content>
            <footer-contacts></footer-contacts>
        </section>
        <section class="footer-down">
            <a :href="url.fb" target="_blank">
                <svg width="30px" height="30px" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                     viewBox="0 0 485 485" style="enable-background:new 0 0 485 485;" xml:space="preserve">
                    <g>
                        <path d="M200.767,400h65.266V242.413h43.798c0,0,4.104-25.428,6.103-53.235h-49.647v-36.264c0-5.416,7.109-12.696,14.153-12.696
                            h35.564V85h-48.366c-68.478,0-66.872,53.082-66.872,61.009v43.356h-31.771v53.029h31.771V400z"/>
                        <path d="M0,0v485h485V0H0z M455,455H30V30h425V455z"/>
                    </g>
                </svg>
            </a>
            <a :href="url.inst">
                <svg version="1.1" width="30px" height="30px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                     viewBox="0 0 364 364" style="enable-background:new 0 0 364 364;" xml:space="preserve">
                    <g>
                        <path style="fill-rule:evenodd;clip-rule:evenodd;" d="M244.424,83.438H119.577c-19.925,0-36.139,16.213-36.139,36.139v124.846
                            c0,19.929,16.214,36.143,36.139,36.143h124.847c19.928,0,36.142-16.214,36.142-36.143V119.577
                            C280.566,99.652,264.352,83.438,244.424,83.438z M181.998,246.894c-35.779,0-64.892-29.113-64.892-64.896
                            c0-35.779,29.113-64.892,64.892-64.892c35.783,0,64.896,29.113,64.896,64.892C246.894,217.781,217.781,246.894,181.998,246.894z
                             M248.982,130.525c-8.471,0-15.359-6.888-15.359-15.354c0-8.467,6.888-15.355,15.359-15.355c8.466,0,15.354,6.888,15.354,15.355
                            C264.336,123.638,257.448,130.525,248.982,130.525z"/>
                        <path style="fill-rule:evenodd;clip-rule:evenodd;" d="M181.998,144.531c-20.655,0-37.475,16.812-37.475,37.467
                            c0,20.663,16.82,37.479,37.475,37.479c20.663,0,37.471-16.816,37.471-37.479C219.469,161.343,202.661,144.531,181.998,144.531z"/>
                        <path style="fill-rule:evenodd;clip-rule:evenodd;" d="M0,0v364h364V0H0z M307.984,244.423c0,35.053-28.508,63.561-63.56,63.561
                            H119.577c-35.049,0-63.561-28.508-63.561-63.561V119.577c0-35.049,28.512-63.561,63.561-63.561h124.847
                            c35.052,0,63.56,28.512,63.56,63.561V244.423z"/>
                    </g>
                </svg>
            </a>
        </section>
    </footer>
</template>
<script>
    import Footercontent from './Footercontent';
    import Footercontacts from './Footercontacts';
    export default {
        data(){
            return {
                url:{
                    fb:'https://www.facebook.com/cudrag.accesorii.md/',
                    inst:'#inst'
                }
            }
        },
        components:{
            footerContent:Footercontent,
            footerContacts:Footercontacts,
        }

    }
</script>