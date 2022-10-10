;(this.webpackJsonpweb = this.webpackJsonpweb || []).push([
  [0],
  {
    105: function (h, F, T) {},
    106: function (h, F, T) {},
    107: function (h, F, T) {},
    120: function (U, J, H) {
      'use strict'
      H.r(J)
      var Z = H(1),
        Q = H(34),
        V = H.n(Q),
        R = (H(105), H(88)),
        K = H(180),
        A = H(169),
        q = (H(106), H(2)),
        G = (H(107), function () {}),
        E = function (LZ, LW) {
          var Lc = Object(Z.useRef)(G)
          Object(Z.useEffect)(
            function () {
              Lc.current = LW
            },
            [LW]
          )
          Object(Z.useEffect)(
            function () {
              var LV = function (Lg) {
                var LB = Lg.data,
                  Lx = LB.action,
                  LN = LB.data
                Lc.current && Lx === LZ && Lc.current(LN)
              }
              return (
                window.addEventListener('message', LV),
                function () {
                  return window.removeEventListener('message', LV)
                }
              )
            },
            [LZ]
          )
        },
        Y = H(31),
        L0 = H.n(Y),
        L1 = H(59)
      function L2(LZ, LW) {
        return L3.apply(this, arguments)
      }
      function L3() {
        return (L3 = Object(L1.a)(
          L0.a.mark(function LZ(LW, LQ) {
            var Lp, LV, Lg, LB
            return L0.a.wrap(function (Lx) {
              for (;;) {
                switch ((Lx.prev = Lx.next)) {
                  case 0:
                    return (
                      (Lp = {
                        method: 'post',
                        headers: {
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: JSON.stringify(LQ),
                      }),
                      (LV = window.GetParentResourceName
                        ? window.GetParentResourceName()
                        : 'nui-frame-app'),
                      (Lx.next = 4),
                      fetch('https://'.concat(LV, '/').concat(LW), Lp)
                    )
                  case 4:
                    return (Lg = Lx.sent), (Lx.next = 7), Lg.json()
                  case 7:
                    return (LB = Lx.sent), Lx.abrupt('return', LB)
                  case 9:
                  case 'end':
                    return Lx.stop()
                }
              }
            }, LZ)
          })
        )).apply(this, arguments)
      }
      var L4 = ['Escape'],
        L5 = H(178),
        L6 = H(181),
        L7 = H(175),
        L8 = H(182),
        L9 = H(183),
        LL = H(171),
        La = H(176),
        Lh = H(172),
        LF = H(186),
        LT = H(177),
        LC = H(168),
        Lm = H(173),
        Lr = Object(A.a)({
          root: {
            top: '0px',
            left: '0px',
            width: '100vw',
            height: '100vh',
            position: 'absolute',
            maxWidth: '100vw',
            minWidth: '100vw',
            maxHeight: '100vh',
            minHeight: '100vh',
            pointerEvents: 'none',
            border: '0px',
            margin: '0px',
            outline: '0px',
            padding: '0px',
            overflow: 'hidden',
            '& .MuiInput-root': {
              color: 'white',
              fontSize: '1.3vmin',
            },
            '& .MuiInput-underline:hover:not(.Mui-disabled):before': {
              borderColor: 'darkgray',
            },
            '& .MuiInput-underline:before': {
              borderColor: 'darkgray',
              color: 'blue',
            },
            '& .MuiInput-underline:after': {
              borderColor: 'white',
              color: 'blue',
            },
            '& .MuiInputLabel-animated': {
              color: 'darkgray',
              fontSize: '1.5vmin',
            },
            '& .MuiInputAdornment-root': { color: 'darkgray' },
          },
          checkbox: {
            '&:hover': { backgroundColor: 'transparent !important' },
          },
          hudOuterContainer: {
            width: '100vw',
            height: '100vh',
            display: 'flex',
            zIndex: '50',
            position: 'relative',
            flexDirection: 'column',
          },
          hudInnerContainer: {
            top: '0px',
            left: '0px',
            width: '100vw',
            height: '100vh',
            display: 'flex',
            position: 'absolute',
            alignItems: 'flex-end',
          },
          hudIconWrapper: {
            width: '54px',
            height: '54px',
            display: 'flex',
            position: 'relative',
            alignItems: 'center',
            justifyContent: 'center',
            opacity: 0,
            maxWidth: '54px',
          },
          hudIcon: {
            top: '0px',
            left: '0px',
            width: '100%',
            height: '100%',
            display: 'flex',
            position: 'absolute',
            alignItems: 'center',
            justifyContent: 'center',
          },
          iconWrapper: {
            width: '34px',
            height: '34px',
            display: 'flex',
            alignItems: 'center',
            borderRadius: '100%',
            justifyContent: 'center',
            backgroundColor: 'rgb(33, 33, 33)',
          },
          radioChannelWrapper: {
            color: 'white',
            zIndex: '250',
            position: 'absolute',
          },
          vehicleHudContainer: {
            top: '0px',
            left: '0px',
            width: '100vw',
            height: '100vh',
            position: 'absolute',
          },
          minimapBorder: {
            top: 'calc(74vh - 4px)',
            left: '0.3125vw',
            width: '13.125vw',
            border: '4px solid rgb(189, 189, 189)',
            height: '20vh',
            position: 'absolute',
            boxSizing: 'content-box',
            borderRadius: '100%',
          },
        }),
        Lk = H(0),
        Lo = function () {
          var LW = Lr(),
            LQ = Object(Z.useState)(false),
            Lp = Object(q.a)(LQ, 2),
            LV = Lp[0],
            Lg = Lp[1],
            LB = Object(Z.useState)(false),
            Lx = Object(q.a)(LB, 2),
            LN = Lx[0],
            LI = Lx[1],
            Lu = Object(Z.useState)(false),
            Lw = Object(q.a)(Lu, 2),
            LD = Lw[0],
            Lz = Lw[1],
            LP = Object(Z.useState)(''),
            LS = Object(q.a)(LP, 2),
            Lf = LS[0],
            LR = LS[1],
            LK = Object(Z.useState)(false),
            LA = Object(q.a)(LK, 2),
            Ly = LA[0],
            Lq = LA[1],
            LM = Object(Z.useState)(true),
            LG = Object(q.a)(LM, 2),
            LE = LG[0],
            LO = LG[1],
            LY = Object(Z.useState)(true),
            Lv = Object(q.a)(LY, 2),
            a0 = Lv[0],
            a1 = Lv[1],
            a2 = Object(Z.useState)(true),
            a3 = Object(q.a)(a2, 2),
            a4 = a3[0],
            a5 = a3[1],
            a6 = Object(Z.useState)(true),
            a7 = Object(q.a)(a6, 2),
            a8 = a7[0],
            a9 = a7[1],
            aL = Object(Z.useState)(true),
            aF = Object(q.a)(aL, 2),
            aT = aF[0],
            aC = aF[1],
            am = Object(Z.useState)(true),
            ak = Object(q.a)(am, 2),
            aU = ak[0],
            aJ = ak[1],
            aH = Object(Z.useState)(false),
            aX = Object(q.a)(aH, 2),
            aZ = aX[0],
            aW = aX[1],
            aQ = Object(Z.useState)(false),
            ap = Object(q.a)(aQ, 2),
            aV = ap[0],
            ag = ap[1],
            aB = Object(Z.useState)(false),
            ax = Object(q.a)(aB, 2),
            aN = ax[0],
            aI = ax[1],
            au = Object(Z.useState)(false),
            aw = Object(q.a)(au, 2),
            aD = aw[0],
            az = aw[1],
            aP = Object(Z.useState)(false),
            aS = Object(q.a)(aP, 2),
            af = aS[0],
            aR = aS[1],
            aK = Object(Z.useState)(''),
            aA = Object(q.a)(aK, 2),
            ay = aA[0],
            aq = aA[1],
            aM = Object(Z.useState)(''),
            aG = Object(q.a)(aM, 2),
            aE = aG[0],
            aO = aG[1],
            aY = Object(Z.useState)(''),
            av = Object(q.a)(aY, 2),
            h0 = av[0],
            h1 = av[1],
            h2 = Object(Z.useState)(''),
            h3 = Object(q.a)(h2, 2),
            h4 = h3[0],
            h5 = h3[1],
            h6 = Object(Z.useState)(''),
            h7 = Object(q.a)(h6, 2),
            h8 = h7[0],
            h9 = h7[1],
            hL = Object(Z.useState)(''),
            hF = Object(q.a)(hL, 2),
            hT = hF[0],
            hC = hF[1],
            hm = Object(Z.useState)(''),
            hk = Object(q.a)(hm, 2),
            hU = hk[0],
            hJ = hk[1],
            hH = Object(Z.useState)(''),
            hX = Object(q.a)(hH, 2),
            hZ = hX[0],
            hW = hX[1],
            hQ = Object(Z.useState)(''),
            hp = Object(q.a)(hQ, 2),
            hV = hp[0],
            hg = hp[1],
            hB = Object(Z.useState)(''),
            hx = Object(q.a)(hB, 2),
            hN = hx[0],
            hI = hx[1],
            hu = Object(Z.useState)(0),
            hw = Object(q.a)(hu, 2),
            hD = hw[0],
            hz = hw[1],
            hP = Object(Z.useState)(0),
            hS = Object(q.a)(hP, 2),
            hf = hS[0],
            hR = hS[1],
            hK = Object(Z.useState)(0),
            hA = Object(q.a)(hK, 2),
            hy = (hA[0], hA[1]),
            hq = Object(Z.useState)(0),
            hM = Object(q.a)(hq, 2),
            hG = hM[0],
            hE = hM[1],
            hO = Object(Z.useState)(true),
            hY = Object(q.a)(hO, 2),
            hv = hY[0],
            F0 = hY[1],
            F1 = Object(Z.useState)(true),
            F2 = Object(q.a)(F1, 2),
            F3 = F2[0],
            F4 = F2[1],
            F5 = Object(Z.useState)(false),
            F6 = Object(q.a)(F5, 2),
            F7 = F6[0],
            F8 = F6[1],
            F9 = Object(Z.useState)(false),
            FL = Object(q.a)(F9, 2),
            FF = FL[0],
            FT = FL[1],
            FC = Object(Z.useState)(false),
            Fm = Object(q.a)(FC, 2),
            Fk = Fm[0],
            FU = Fm[1],
            FJ = Object(Z.useState)('16'),
            FH = Object(q.a)(FJ, 2),
            FX = FH[0],
            FZ = FH[1],
            FW = Object(Z.useState)('16'),
            FQ = Object(q.a)(FW, 2),
            Fp = (FQ[0], FQ[1]),
            FV = Object(Z.useState)('10'),
            Fg = Object(q.a)(FV, 2),
            FB = Fg[0],
            Fx = Fg[1],
            FN = Object(Z.useState)(false),
            FI = Object(q.a)(FN, 2),
            Fu = FI[0],
            Fw = FI[1],
            FD = Object(Z.useState)(false),
            Fz = Object(q.a)(FD, 2),
            FP = Fz[0],
            FS = Fz[1],
            Ff = Object(Z.useState)(false),
            FR = Object(q.a)(Ff, 2),
            FK = FR[0],
            FA = FR[1],
            Fy = Object(Z.useState)(true),
            Fq = Object(q.a)(Fy, 2),
            FM = Fq[0],
            FG = Fq[1],
            FE = Object(Z.useState)(false),
            FO = Object(q.a)(FE, 2),
            FY = FO[0],
            Fv = FO[1],
            T0 = Object(Z.useState)(true),
            T1 = Object(q.a)(T0, 2),
            T2 = T1[0],
            T3 = T1[1],
            T4 = Object(Z.useState)('android'),
            T5 = Object(q.a)(T4, 2),
            T6 = T5[0],
            T7 = T5[1],
            T8 = Object(Z.useState)('https://i.imgur.com/3KTfLIV.jpg'),
            T9 = Object(q.a)(T8, 2),
            TL = T9[0],
            TF = T9[1],
            TT = Object(Z.useState)(true),
            TC = Object(q.a)(TT, 2),
            Tm = TC[0],
            Tk = TC[1],
            TU = Object(Z.useState)(true),
            TJ = Object(q.a)(TU, 2),
            TH = TJ[0],
            TX = TJ[1],
            TZ = Object(Z.useState)(true),
            TW = Object(q.a)(TZ, 2),
            TQ = TW[0],
            Tp = TW[1],
            TV = Object(Z.useState)(true),
            Tg = Object(q.a)(TV, 2),
            TB = Tg[0],
            Tx = Tg[1],
            TN = Object(Z.useState)(0),
            TI = Object(q.a)(TN, 2),
            Tu = TI[0],
            Tw = TI[1],
            TD = Object(Z.useState)(false),
            Tz = Object(q.a)(TD, 2),
            TP = Tz[0],
            TS = Tz[1],
            Tf = Object(Z.useState)('3'),
            TR = Object(q.a)(Tf, 2),
            TK = TR[0],
            TA = TR[1],
            Ty = Object(Z.useState)(false),
            Tq = Object(q.a)(Ty, 2),
            TM = Tq[0],
            TG = Tq[1],
            TE = Object(Z.useState)(false),
            TO = Object(q.a)(TE, 2),
            TY = TO[0],
            Tv = TO[1],
            C0 = Object(Z.useState)(false),
            C1 = Object(q.a)(C0, 2),
            C2 = C1[0],
            C3 = C1[1],
            C4 = Object(Z.useState)(false),
            C5 = Object(q.a)(C4, 2),
            C6 = (C5[0], C5[1], Object(Z.useState)(false)),
            C7 = Object(q.a)(C6, 2),
            C8 = (C7[0], C7[1], Object(Z.useState)(false)),
            C9 = Object(q.a)(C8, 2),
            CL = C9[0],
            CF = C9[1],
            CT = Object(Z.useState)(false),
            CC = Object(q.a)(CT, 2),
            Cm = CC[0],
            Ck = CC[1],
            CU = Object(Z.useState)(false),
            CJ = Object(q.a)(CU, 2),
            CH = CJ[0],
            CX = CJ[1],
            CZ = Object(Z.useState)(false),
            CW = Object(q.a)(CZ, 2),
            CQ = CW[0],
            Cp = CW[1],
            CV = Object(Z.useState)(false),
            Cg = Object(q.a)(CV, 2),
            CB = Cg[0],
            Cx = Cg[1],
            CN = Object(Z.useState)(false),
            CI = Object(q.a)(CN, 2),
            Cu = CI[0],
            Cw = CI[1],
            CD = Object(Z.useState)(false),
            Cz = Object(q.a)(CD, 2),
            CP = Cz[0],
            CS = Cz[1],
            Cf = function () {
              L2('np-hud:hudSetPreferences', {
                'hud.compass.enabled': hv,
                'hud.compass.fps': FX,
                'hud.compass.roadnames.enabled': F3,
                'hud.vehicle.speedometer.fps': 64,
                'hud.vehicle.minimap.enabled': FM,
                'hud.vehicle.minimap.default': FY,
                'hud.misc.circle.taskbar.enabled': FF,
                'phone.misc.brand': T6,
                'phone.misc.background': TL,
                'phone.misc.receive.sms': Tm,
                'phone.misc.new.tweet': TH,
                'phone.misc.receive.email': TQ,
                'phone.misc.embedded.images': TB,
              })
              L2('np-hud:setKVPValue', {
                key: 'np-preferences',
                value: {
                  'hud.misc.circle.taskbar.enabled': FF,
                  'hud.status.health.enabled': LE,
                  'hud.status.armor.enabled': a0,
                  'hud.status.hunger.enabled': a4,
                  'hud.status.thirst.enabled': a8,
                  'hud.status.oxygen.enabled': aT,
                  'hud.status.stress.enabled': aU,
                  'hud.status.enhancements.enabled': Fk,
                  'hud.status.health.hideValue': mB,
                  'hud.status.armor.hideValue': rV,
                  'hud.status.hunger.hideValue': k8,
                  'hud.status.thirst.hideValue': ky,
                  'hud.status.radio.channel.visibility': TK,
                  'hud.vehicle.minimap.enabled': FM,
                  'hud.vehicle.minimap.default': FY,
                  'hud.vehicle.minimap.outline': T2,
                  'hud.vehicle.speedometer.fps': 120,
                  'hud.compass.enabled': hv,
                  'hud.compass.fps': FX,
                  'hud.compass.roadnames.enabled': F3,
                  'hud.blackbars.enabled': F7,
                  'hud.blackbars.value': FB,
                  'phone.misc.brand': T6,
                  'phone.misc.background': TL,
                  'phone.misc.receive.sms': Tm,
                  'phone.misc.new.tweet': TH,
                  'phone.misc.receive.email': TQ,
                  'phone.misc.embedded.images': TB,
                  'phone.volume': 0.8,
                  'phone.balance': 1,
                  'radio.stereo.enabled': true,
                  'radio.volume': 0.8,
                  'radio.balance': 1,
                  'radio.clicks.outgoing.enabled': true,
                  'radio.clicks.incoming.enabled': true,
                  'radio.clicks.volume': 0.8,
                  'rtc.settings.device': '',
                  'rtc.settings.phone.filter.enabled': true,
                  'rtc.settings.phone.filter.gainNode': 1,
                  'rtc.settings.phone.filter.pannerNode': 0.4,
                  'rtc.settings.phone.filter.highpassBiquad': 500,
                  'rtc.settings.phone.filter.lowpassBiquad': 8000,
                  'rtc.settings.phone.filter.waveShaper': 5,
                  'rtc.settings.radio.filter.enabled': true,
                  'rtc.settings.radio.filter.gainNode': 1.5,
                  'rtc.settings.radio.filter.pannerNode': -0.4,
                  'rtc.settings.radio.filter.highpassBiquad': 1000,
                  'rtc.settings.radio.filter.lowpassBiquad': 2000,
                  'rtc.settings.radio.filter.waveShaper': 9,
                  'rtc.system': {},
                },
              })
            },
            CR = function (Qx, QN) {
              var QI = 0
              if (QN) {
                if (((QI = Number(Qx.target.value)), 'Enter' !== Qx.key)) {
                  return
                }
              } else {
                QI = Number(Qx)
              }
              mx(QI)
              mw(QI)
              mQ >= QI && 100 !== QI
                ? (mG(0),
                  mS(false),
                  setTimeout(function () {
                    mA(false)
                  }, 2000))
                : true === LE && (mA(true), mG(1))
            },
            CK = function (Qx, QN) {
              var Qu = 0
              if (QN) {
                if (((Qu = Number(Qx.target.value)), 'Enter' !== Qx.key)) {
                  return
                }
              } else {
                Qu = Number(Qx)
              }
              rg(Qu)
              rI(Qu)
              rZ >= Qu && 100 !== Qu
                ? (rq(0),
                  rz(false),
                  setTimeout(function () {
                    rR(false)
                  }, 2000))
                : true === a0 && (rR(true), rq(1))
            },
            CA = function (Qx, QN) {
              var Qu = 0
              if (QN) {
                if (((Qu = Number(Qx.target.value)), 'Enter' !== Qx.key)) {
                  return
                }
              } else {
                Qu = Number(Qx)
              }
              k9(Qu)
              kC(Qu)
              k4 >= Qu && 100 !== Qu
                ? (kg(0),
                  kJ(false),
                  setTimeout(function () {
                    kW(false)
                  }, 2000))
                : true === a4 && (kW(true), kg(1))
            },
            Cy = function (Qx, QN) {
              var Qu = 0
              if (QN) {
                if (((Qu = Number(Qx.target.value)), 'Enter' !== Qx.key)) {
                  return
                }
              } else {
                Qu = Number(Qx)
              }
              kq(Qu)
              kO(Qu)
              kf >= Qu && 100 !== Qu
                ? (o9(0),
                  o1(false),
                  setTimeout(function () {
                    o5(false)
                  }, 2000))
                : true === a8 && (o5(true), o9(1))
            },
            Cq = Object(Z.useState)(true),
            CM = Object(q.a)(Cq, 2),
            CG = CM[0],
            CE = CM[1],
            CO = Object(Z.useState)('white'),
            CY = Object(q.a)(CO, 2),
            Cv = (CY[0], CY[1]),
            m0 = Object(Z.useState)(false),
            m1 = Object(q.a)(m0, 2),
            m2 = m1[0],
            m3 = m1[1],
            m4 = Object(Z.useState)(false),
            m5 = Object(q.a)(m4, 2),
            m6 = m5[0],
            m7 = m5[1],
            m8 = Object(Z.useState)(1),
            m9 = Object(q.a)(m8, 2),
            mL = m9[0],
            mF = m9[1],
            mT = Object(Z.useState)('125.66370614359172'),
            mC = Object(q.a)(mT, 2),
            mm = mC[0],
            mk = mC[1],
            mU = Object(Z.useState)('125.66370614359172'),
            mJ = Object(q.a)(mU, 2),
            mH = mJ[0],
            mX = mJ[1],
            mZ = Object(Z.useState)(0),
            mW = Object(q.a)(mZ, 2),
            mQ = mW[0],
            mp = mW[1],
            mV = Object(Z.useState)(99),
            mg = Object(q.a)(mV, 2),
            mB = mg[0],
            mx = mg[1],
            mN = Object(Z.useState)(99),
            mI = Object(q.a)(mN, 2),
            mu = mI[0],
            mw = mI[1],
            mD = Object(Z.useState)(false),
            mz = Object(q.a)(mD, 2),
            mP = mz[0],
            mS = mz[1],
            mf = Object(Z.useState)(true),
            mR = Object(q.a)(mf, 2),
            mK = mR[0],
            mA = mR[1],
            my = Object(Z.useState)(1),
            mq = Object(q.a)(my, 2),
            mM = mq[0],
            mG = mq[1],
            mE = Object(Z.useState)('125.66370614359172'),
            mO = Object(q.a)(mE, 2),
            mY = mO[0],
            mv = mO[1],
            r0 = Object(Z.useState)('125.66370614359172'),
            r1 = Object(q.a)(r0, 2),
            r2 = r1[0],
            r3 = r1[1],
            r4 = Object(Z.useState)(0),
            r5 = Object(q.a)(r4, 2),
            r6 = (r5[0], r5[1], Object(Z.useState)(false)),
            r7 = Object(q.a)(r6, 2),
            r8 = r7[0],
            r9 = (r7[1], Object(Z.useState)(0)),
            rL = Object(q.a)(r9, 2),
            rF = rL[0],
            rT = (rL[1], Object(Z.useState)('125.66370614359172')),
            rC = Object(q.a)(rT, 2),
            rm = rC[0],
            rk = (rC[1], Object(Z.useState)('125.66370614359172')),
            rU = Object(q.a)(rk, 2),
            rJ = rU[0],
            rH = (rU[1], Object(Z.useState)(0)),
            rX = Object(q.a)(rH, 2),
            rZ = rX[0],
            rW = rX[1],
            rQ = Object(Z.useState)(99),
            rp = Object(q.a)(rQ, 2),
            rV = rp[0],
            rg = rp[1],
            rB = Object(Z.useState)(99),
            rx = Object(q.a)(rB, 2),
            rN = rx[0],
            rI = rx[1],
            ru = Object(Z.useState)(false),
            rw = Object(q.a)(ru, 2),
            rD = rw[0],
            rz = rw[1],
            rP = Object(Z.useState)(true),
            rS = Object(q.a)(rP, 2),
            rf = rS[0],
            rR = rS[1],
            rK = Object(Z.useState)(1),
            rA = Object(q.a)(rK, 2),
            ry = rA[0],
            rq = rA[1],
            rM = Object(Z.useState)('125.66370614359172'),
            rG = Object(q.a)(rM, 2),
            rE = rG[0],
            rO = rG[1],
            rY = Object(Z.useState)('125.66370614359172'),
            rv = Object(q.a)(rY, 2),
            k0 = rv[0],
            k1 = rv[1],
            k2 = Object(Z.useState)(0),
            k3 = Object(q.a)(k2, 2),
            k4 = k3[0],
            k5 = k3[1],
            k6 = Object(Z.useState)(99),
            k7 = Object(q.a)(k6, 2),
            k8 = k7[0],
            k9 = k7[1],
            kL = Object(Z.useState)(99),
            kF = Object(q.a)(kL, 2),
            kT = kF[0],
            kC = kF[1],
            km = Object(Z.useState)(false),
            kk = Object(q.a)(km, 2),
            kU = kk[0],
            kJ = kk[1],
            kH = Object(Z.useState)(true),
            kX = Object(q.a)(kH, 2),
            kZ = kX[0],
            kW = kX[1],
            kQ = Object(Z.useState)(1),
            kp = Object(q.a)(kQ, 2),
            kV = kp[0],
            kg = kp[1],
            kB = Object(Z.useState)('125.66370614359172'),
            kx = Object(q.a)(kB, 2),
            kN = kx[0],
            kI = kx[1],
            ku = Object(Z.useState)('125.66370614359172'),
            kw = Object(q.a)(ku, 2),
            kD = kw[0],
            kz = kw[1],
            kP = Object(Z.useState)(0),
            kS = Object(q.a)(kP, 2),
            kf = kS[0],
            kR = kS[1],
            kK = Object(Z.useState)(99),
            kA = Object(q.a)(kK, 2),
            ky = kA[0],
            kq = kA[1],
            kM = Object(Z.useState)(99),
            kG = Object(q.a)(kM, 2),
            kE = kG[0],
            kO = kG[1],
            kY = Object(Z.useState)(false),
            kv = Object(q.a)(kY, 2),
            o0 = kv[0],
            o1 = kv[1],
            o2 = Object(Z.useState)(true),
            o3 = Object(q.a)(o2, 2),
            o4 = o3[0],
            o5 = o3[1],
            o6 = Object(Z.useState)(1),
            o7 = Object(q.a)(o6, 2),
            o8 = o7[0],
            o9 = o7[1],
            oL = Object(Z.useState)('125.66370614359172'),
            oF = Object(q.a)(oL, 2),
            oT = oF[0],
            oC = oF[1],
            om = Object(Z.useState)('125.66370614359172'),
            ok = Object(q.a)(om, 2),
            oU = ok[0],
            oJ = ok[1],
            oH = Object(Z.useState)(0),
            oX = Object(q.a)(oH, 2),
            oZ = (oX[0], oX[1], Object(Z.useState)(true)),
            oW = Object(q.a)(oZ, 2),
            oQ = oW[0],
            op = oW[1],
            oV = Object(Z.useState)(1),
            og = Object(q.a)(oV, 2),
            oB = og[0],
            ox = og[1],
            oN = Object(Z.useState)('125.66370614359172'),
            oI = Object(q.a)(oN, 2),
            ou = oI[0],
            ow = oI[1],
            oD = Object(Z.useState)('125.66370614359172'),
            oz = Object(q.a)(oD, 2),
            oP = oz[0],
            oS = oz[1],
            of = Object(Z.useState)(0),
            oR = Object(q.a)(of, 2),
            oK = oR[0],
            oA = oR[1],
            oy = Object(Z.useState)(0),
            oq = Object(q.a)(oy, 2),
            oM = (oq[0], oq[1], Object(Z.useState)(true)),
            oG = Object(q.a)(oM, 2),
            oE = oG[0],
            oO = oG[1],
            oY = Object(Z.useState)(1),
            ov = Object(q.a)(oY, 2),
            U0 = ov[0],
            U1 = ov[1],
            U2 = Object(Z.useState)('125.66370614359172'),
            U3 = Object(q.a)(U2, 2),
            U4 = U3[0],
            U5 = U3[1],
            U6 = Object(Z.useState)('125.66370614359172'),
            U7 = Object(q.a)(U6, 2),
            U8 = U7[0],
            U9 = U7[1],
            UL = Object(Z.useState)(0),
            UF = Object(q.a)(UL, 2),
            UT = (UF[0], UF[1]),
            UC = Object(Z.useState)(false),
            Um = Object(q.a)(UC, 2),
            Uk = Um[0],
            UU = Um[1],
            UJ = Object(Z.useState)(0),
            UH = Object(q.a)(UJ, 2),
            UX = UH[0],
            UZ = UH[1],
            UW = Object(Z.useState)('125.66370614359172'),
            UQ = Object(q.a)(UW, 2),
            Up = UQ[0],
            UV = UQ[1],
            Ug = Object(Z.useState)('125.66370614359172'),
            UB = Object(q.a)(Ug, 2),
            Ux = UB[0],
            UN = UB[1],
            UI = Object(Z.useState)(false),
            Uu = Object(q.a)(UI, 2),
            Uw = Uu[0],
            UD = Uu[1],
            Uz = Object(Z.useState)(0),
            UP = Object(q.a)(Uz, 2),
            US = (UP[0], UP[1], Object(Z.useState)(false)),
            Uf = Object(q.a)(US, 2),
            UR = Uf[0],
            UK = Uf[1],
            UA = Object(Z.useState)(0),
            Uy = Object(q.a)(UA, 2),
            Uq = Uy[0],
            UM = Uy[1],
            UG = Object(Z.useState)('125.66370614359172'),
            UE = Object(q.a)(UG, 2),
            UO = UE[0],
            Ub = (UE[1], Object(Z.useState)('125.66370614359172')),
            UY = Object(q.a)(Ub, 2),
            Uv = UY[0],
            J0 = (UY[1], Object(Z.useState)(false)),
            J1 = Object(q.a)(J0, 2),
            J2 = J1[0],
            J3 = (J1[1], Object(Z.useState)(0)),
            J4 = Object(q.a)(J3, 2),
            J5 = (J4[0], J4[1]),
            J6 = Object(Z.useState)(false),
            J7 = Object(q.a)(J6, 2),
            J8 = J7[0],
            J9 = J7[1],
            JL = Object(Z.useState)(0),
            JF = Object(q.a)(JL, 2),
            JT = JF[0],
            JC = JF[1],
            Jm = Object(Z.useState)('125.66370614359172'),
            Jk = Object(q.a)(Jm, 2),
            JU = Jk[0],
            JJ = Jk[1],
            JH = Object(Z.useState)('125.66370614359172'),
            JX = Object(q.a)(JH, 2),
            JZ = JX[0],
            JW = JX[1],
            JQ = Object(Z.useState)(false),
            Jp = Object(q.a)(JQ, 2),
            JV = Jp[0],
            Jg = Jp[1],
            JB = Object(Z.useState)(0),
            Jx = Object(q.a)(JB, 2),
            JN = (Jx[0], Jx[1]),
            JI = Object(Z.useState)(false),
            Ju = Object(q.a)(JI, 2),
            Jw = Ju[0],
            JD = Ju[1],
            Jz = Object(Z.useState)(0),
            JP = Object(q.a)(Jz, 2),
            JS = JP[0],
            Jf = JP[1],
            JR = Object(Z.useState)('125.66370614359172'),
            JK = Object(q.a)(JR, 2),
            JA = JK[0],
            Jy = JK[1],
            Jq = Object(Z.useState)('125.66370614359172'),
            JM = Object(q.a)(Jq, 2),
            JG = JM[0],
            JE = JM[1],
            JO = Object(Z.useState)(false),
            Jb = Object(q.a)(JO, 2),
            JY = Jb[0],
            Jv = Jb[1],
            H0 = Object(Z.useState)(0),
            H1 = Object(q.a)(H0, 2),
            H2 = (H1[0], H1[1], Object(Z.useState)(false)),
            H3 = Object(q.a)(H2, 2),
            H4 = H3[0],
            H5 = H3[1],
            H6 = Object(Z.useState)(0),
            H7 = Object(q.a)(H6, 2),
            H8 = H7[0],
            H9 = H7[1],
            HL = Object(Z.useState)('125.66370614359172'),
            HF = Object(q.a)(HL, 2),
            HT = HF[0],
            HC = (HF[1], Object(Z.useState)('125.66370614359172')),
            Hm = Object(q.a)(HC, 2),
            Hk = Hm[0],
            HU = (Hm[1], Object(Z.useState)(false)),
            HJ = Object(q.a)(HU, 2),
            HH = HJ[0],
            HX = (HJ[1], Object(Z.useState)(0)),
            HZ = Object(q.a)(HX, 2),
            HW = (HZ[0], HZ[1]),
            HQ = Object(Z.useState)(false),
            Hp = Object(q.a)(HQ, 2),
            HV = Hp[0],
            Hg = Hp[1],
            HB = Object(Z.useState)(0),
            Hx = Object(q.a)(HB, 2),
            HN = Hx[0],
            HI = Hx[1],
            Hu = Object(Z.useState)('125.66370614359172'),
            Hw = Object(q.a)(Hu, 2),
            HD = Hw[0],
            HP = Hw[1],
            HS = Object(Z.useState)('125.66370614359172'),
            Hf = Object(q.a)(HS, 2),
            HR = Hf[0],
            HK = Hf[1],
            HA = Object(Z.useState)(false),
            Hy = Object(q.a)(HA, 2),
            Hq = Hy[0],
            HM = Hy[1],
            HG = Object(Z.useState)(0),
            HE = Object(q.a)(HG, 2),
            HO = (HE[0], HE[1], Object(Z.useState)(false)),
            HY = Object(q.a)(HO, 2),
            Hv = HY[0],
            X0 = HY[1],
            X1 = Object(Z.useState)(0),
            X2 = Object(q.a)(X1, 2),
            X3 = X2[0],
            X4 = X2[1],
            X5 = Object(Z.useState)('125.66370614359172'),
            X6 = Object(q.a)(X5, 2),
            X7 = X6[0],
            X8 = (X6[1], Object(Z.useState)('125.66370614359172')),
            X9 = Object(q.a)(X8, 2),
            XL = X9[0],
            XF = (X9[1], Object(Z.useState)(false)),
            XT = Object(q.a)(XF, 2),
            XC = XT[0],
            Xm = (XT[1], Object(Z.useState)(0)),
            Xk = Object(q.a)(Xm, 2),
            XU = (Xk[0], Xk[1]),
            XJ = Object(Z.useState)(false),
            XH = Object(q.a)(XJ, 2),
            XX = XH[0],
            XZ = XH[1],
            XW = Object(Z.useState)(0),
            XQ = Object(q.a)(XW, 2),
            Xp = XQ[0],
            XV = XQ[1],
            Xg = Object(Z.useState)('125.66370614359172'),
            XB = Object(q.a)(Xg, 2),
            Xx = XB[0],
            XN = XB[1],
            XI = Object(Z.useState)('125.66370614359172'),
            Xu = Object(q.a)(XI, 2),
            Xw = Xu[0],
            XD = Xu[1],
            Xz = Object(Z.useState)(false),
            XP = Object(q.a)(Xz, 2),
            XS = XP[0],
            Xf = XP[1],
            XR = Object(Z.useState)(0),
            XK = Object(q.a)(XR, 2),
            XA = (XK[0], XK[1], Object(Z.useState)(false)),
            Xy = Object(q.a)(XA, 2),
            Xq = Xy[0],
            XM = Xy[1],
            XG = Object(Z.useState)(0),
            XE = Object(q.a)(XG, 2),
            XO = XE[0],
            Xb = XE[1],
            XY = Object(Z.useState)('125.66370614359172'),
            Xv = Object(q.a)(XY, 2),
            Z0 = Xv[0],
            Z1 = (Xv[1], Object(Z.useState)('125.66370614359172')),
            Z2 = Object(q.a)(Z1, 2),
            Z3 = Z2[0],
            Z4 = (Z2[1], Object(Z.useState)(0)),
            Z5 = Object(q.a)(Z4, 2),
            Z6 = (Z5[0], Z5[1], Object(Z.useState)(false)),
            Z7 = Object(q.a)(Z6, 2),
            Z8 = Z7[0],
            Z9 = Z7[1],
            ZL = Object(Z.useState)(false),
            ZF = Object(q.a)(ZL, 2),
            ZT = ZF[0],
            ZC = ZF[1],
            Zm = Object(Z.useState)(0),
            Zk = Object(q.a)(Zm, 2),
            ZU = Zk[0],
            ZJ = Zk[1],
            ZH = Object(Z.useState)('125.66370614359172'),
            ZX = Object(q.a)(ZH, 2),
            ZZ = ZX[0],
            ZW = ZX[1],
            ZQ = Object(Z.useState)('125.66370614359172'),
            Zp = Object(q.a)(ZQ, 2),
            ZV = Zp[0],
            Zg = Zp[1],
            ZB = Object(Z.useState)(0),
            Zx = Object(q.a)(ZB, 2),
            ZN = (Zx[0], Zx[1], Object(Z.useState)(false)),
            ZI = Object(q.a)(ZN, 2),
            Zu = ZI[0],
            Zw = (ZI[1], Object(Z.useState)(0)),
            ZD = Object(q.a)(Zw, 2),
            Zz = ZD[0],
            ZP = (ZD[1], Object(Z.useState)('125.66370614359172')),
            ZS = Object(q.a)(ZP, 2),
            Zf = ZS[0],
            ZR = (ZS[1], Object(Z.useState)('125.66370614359172')),
            ZK = Object(q.a)(ZR, 2),
            ZA = ZK[0],
            Zy = (ZK[1], Object(Z.useState)(0)),
            Zq = Object(q.a)(Zy, 2),
            ZM = (Zq[0], Zq[1], Object(Z.useState)(false)),
            ZG = Object(q.a)(ZM, 2),
            ZE = ZG[0],
            ZO = (ZG[1], Object(Z.useState)(0)),
            Zb = Object(q.a)(ZO, 2),
            ZY = Zb[0],
            Zv = (Zb[1], Object(Z.useState)('125.66370614359172')),
            W0 = Object(q.a)(Zv, 2),
            W1 = W0[0],
            W2 = (W0[1], Object(Z.useState)('125.66370614359172')),
            W3 = Object(q.a)(W2, 2),
            W4 = W3[0],
            W5 = (W3[1], Object(Z.useState)(0)),
            W6 = Object(q.a)(W5, 2),
            W7 = (W6[0], W6[1], Object(Z.useState)(false)),
            W8 = Object(q.a)(W7, 2),
            W9 = W8[0],
            WL = (W8[1], Object(Z.useState)(0)),
            WF = Object(q.a)(WL, 2),
            WT = WF[0],
            WC = (WF[1], Object(Z.useState)('125.66370614359172')),
            Wm = Object(q.a)(WC, 2),
            Wk = Wm[0],
            WU = (Wm[1], Object(Z.useState)('125.66370614359172')),
            WJ = Object(q.a)(WU, 2),
            WH = WJ[0],
            WX = (WJ[1], Object(Z.useState)(100)),
            WZ = Object(q.a)(WX, 2),
            WW = (WZ[0], WZ[1], Object(Z.useState)(false)),
            WQ = Object(q.a)(WW, 2),
            Wp = WQ[0],
            WV = WQ[1],
            Wg = Object(Z.useState)(0),
            WB = Object(q.a)(Wg, 2),
            Wx = WB[0],
            WN = WB[1],
            WI = Object(Z.useState)('125.66370614359172'),
            Wu = Object(q.a)(WI, 2),
            Ww = (Wu[0], Wu[1], Object(Z.useState)('125.66370614359172')),
            WD = Object(q.a)(Ww, 2),
            Wz = (WD[0], WD[1], Object(Z.useState)(0)),
            WP = Object(q.a)(Wz, 2),
            WS = (WP[0], WP[1], Object(Z.useState)(false)),
            Wf = Object(q.a)(WS, 2),
            WR = Wf[0],
            WK = (Wf[1], Object(Z.useState)(0)),
            WA = Object(q.a)(WK, 2),
            Wy = WA[0],
            Wq = (WA[1], Object(Z.useState)('125.66370614359172')),
            WM = Object(q.a)(Wq, 2),
            WG = WM[0],
            WE = (WM[1], Object(Z.useState)('125.66370614359172')),
            WO = Object(q.a)(WE, 2),
            WY = WO[0],
            Wv = (WO[1], Object(Z.useState)(0)),
            Q0 = Object(q.a)(Wv, 2),
            Q1 = (Q0[0], Q0[1], Object(Z.useState)(false)),
            Q2 = Object(q.a)(Q1, 2),
            Q3 = Q2[0],
            Q4 = (Q2[1], Object(Z.useState)(0)),
            Q5 = Object(q.a)(Q4, 2),
            Q6 = Q5[0],
            Q7 = (Q5[1], Object(Z.useState)('125.66370614359172')),
            Q8 = Object(q.a)(Q7, 2),
            Q9 = Q8[0],
            QL = (Q8[1], Object(Z.useState)('125.66370614359172')),
            QF = Object(q.a)(QL, 2),
            QT = QF[0],
            QC = (QF[1], Object(Z.useState)(100)),
            Qm = Object(q.a)(QC, 2),
            Qk = (Qm[0], Qm[1], Object(Z.useState)(false)),
            QU = Object(q.a)(Qk, 2),
            QJ = QU[0],
            QH = QU[1],
            QX = Object(Z.useState)(0),
            QZ = Object(q.a)(QX, 2),
            QW = QZ[0],
            QQ = QZ[1],
            Qp = Object(Z.useState)('125.66370614359172'),
            QV = Object(q.a)(Qp, 2),
            Qg = (QV[0], QV[1], Object(Z.useState)('125.66370614359172')),
            QB = Object(q.a)(Qg, 2)
          return (
            QB[0],
            QB[1],
            (E('uiMessage', function (Qx) {
              var QI = Qx.data,
                Qu = Qx.app
              if (
                ('main' === Qu && 'restart' === Qx.action && Lg(false),
                'preferences' === Qu &&
                  (void 0 !== QI['hud.misc.circle.taskbar.enabled'] &&
                    FT(QI['hud.misc.circle.taskbar.enabled']),
                  void 0 !== QI['hud.status.health.enabled'] &&
                    LO(QI['hud.status.health.enabled']),
                  void 0 !== QI['hud.status.armor.enabled'] &&
                    a1(QI['hud.status.armor.enabled']),
                  void 0 !== QI['hud.status.hunger.enabled'] &&
                    a5(QI['hud.status.hunger.enabled']),
                  void 0 !== QI['hud.status.thirst.enabled'] &&
                    a9(QI['hud.status.thirst.enabled']),
                  void 0 !== QI['hud.status.oxygen.enabled'] &&
                    aC(QI['hud.status.oxygen.enabled']),
                  void 0 !== QI['hud.status.stress.enabled'] &&
                    aJ(QI['hud.status.stress.enabled']),
                  void 0 !== QI['hud.status.enhancements.enabled'] &&
                    FU(QI['hud.status.enhancements.enabled']),
                  void 0 !== QI['hud.status.health.hideValue'] &&
                    CR(QI['hud.status.health.hideValue'], false),
                  void 0 !== QI['hud.status.armor.hideValue'] &&
                    CK(QI['hud.status.armor.hideValue'], false),
                  void 0 !== QI['hud.status.hunger.hideValue'] &&
                    CA(QI['hud.status.hunger.hideValue'], false),
                  void 0 !== QI['hud.status.thirst.hideValue'] &&
                    Cy(QI['hud.status.thirst.hideValue'], false),
                  void 0 !== QI['hud.status.radio.channel.visibility'] &&
                    TA(QI['hud.status.radio.channel.visibility']),
                  void 0 !== QI['hud.vehicle.minimap.enabled'] &&
                    FG(QI['hud.vehicle.minimap.enabled']),
                  void 0 !== QI['hud.vehicle.minimap.default'] &&
                    Fv(QI['hud.vehicle.minimap.default']),
                  void 0 !== QI['hud.vehicle.minimap.outline'] &&
                    T3(QI['hud.vehicle.minimap.outline']),
                  void 0 !== QI['hud.vehicle.speedometer.fps'] && Fp('64'),
                  void 0 !== QI['hud.compass.enabled'] &&
                    F0(QI['hud.compass.enabled']),
                  void 0 !== QI['hud.compass.fps'] && FZ(QI['hud.compass.fps']),
                  void 0 !== QI['hud.compass.roadnames.enabled'] &&
                    F4(QI['hud.compass.roadnames.enabled']),
                  void 0 !== QI['hud.blackbars.enabled'] &&
                    F8(QI['hud.blackbars.enabled']),
                  void 0 !== QI['hud.blackbars.value'] &&
                    Fx(QI['hud.blackbars.value']),
                  void 0 !== QI['phone.misc.brand'] &&
                    T7(QI['phone.misc.brand']),
                  void 0 !== QI['phone.misc.background'] &&
                    TF(QI['phone.misc.background']),
                  void 0 !== QI['phone.misc.receive.sms'] &&
                    Tk(QI['phone.misc.receive.sms']),
                  void 0 !== QI['phone.misc.new.tweet'] &&
                    TX(QI['phone.misc.new.tweet']),
                  void 0 !== QI['phone.misc.receive.email'] &&
                    Tp(QI['phone.misc.receive.email']),
                  void 0 !== QI['phone.misc.embedded.images'] &&
                    Tx(QI['phone.misc.embedded.images']),
                  L2('np-hud:hudSetPreferences', QI)),
                'buffs' === Qu &&
                  (void 0 !== QI.buffedBikeStats
                    ? 'number' === typeof QI.buffedBikeStats &&
                      (QI.buffedBikeStats > 0
                        ? (Xf(true),
                          XU(QI.buffedBikeStats),
                          XZ(true),
                          XV(1),
                          setTimeout(function () {
                            var cX = Number(QI.buffedBikeStats),
                              cZ = 40 * Math.PI,
                              cW = -(cZ - ((100 * cX) / 100 / 100) * cZ)
                            XN(''.concat(cZ))
                            XD(''.concat(cW))
                          }, 500))
                        : 0 === QI.buffedBikeStats &&
                          (XV(0),
                          Xf(false),
                          XN('125.66370614359172'),
                          XD('125.66370614359172'),
                          setTimeout(function () {
                            XZ(false)
                          }, 2000)))
                    : (XV(0),
                      Xf(false),
                      XN('125.66370614359172'),
                      XD('125.66370614359172'),
                      setTimeout(function () {
                        XZ(false)
                      }, 2000)),
                  void 0 !== QI.buffedOxygen &&
                    (true === QI.buffedOxygen ? TG(true) : TG(false)),
                  void 0 !== QI.buffedHunger &&
                    (true === QI.buffedHunger
                      ? (Tv(true), kZ || Fk || (kW(true), kg(1)))
                      : (Tv(false),
                        k4 >= k8 &&
                          (kg(0),
                          setTimeout(function () {
                            kW(false)
                          }, 2000)))),
                  void 0 !== QI.buffedStress &&
                    (true === QI.buffedStress
                      ? (C3(true), oE || Fk || (oO(true), U1(1)))
                      : (C3(false),
                        oK <= 1 &&
                          (U1(0),
                          setTimeout(function () {
                            oO(false)
                          }, 2000)))),
                  void 0 !== QI.buffedInt
                    ? 'number' === typeof QI.buffedInt &&
                      (QI.buffedInt > 0
                        ? (UD(true),
                          UT(QI.buffedInt),
                          UU(true),
                          UZ(1),
                          setTimeout(function () {
                            var cX = Number(QI.buffedInt),
                              cZ = 40 * Math.PI,
                              cW = -(cZ - ((100 * cX) / 100 / 100) * cZ)
                            UV(''.concat(cZ))
                            UN(''.concat(cW))
                          }, 500))
                        : 0 === QI.buffedInt &&
                          (UZ(0),
                          UD(false),
                          UV('125.66370614359172'),
                          UN('125.66370614359172'),
                          setTimeout(function () {
                            UU(false)
                          }, 2000)))
                    : (UZ(0),
                      UD(false),
                      UV('125.66370614359172'),
                      UN('125.66370614359172'),
                      setTimeout(function () {
                        UU(false)
                      }, 2000)),
                  void 0 !== QI.buffedStrength
                    ? 'number' === typeof QI.buffedStrength &&
                      (QI.buffedStrength > 0
                        ? (Jg(true),
                          J5(QI.buffedStrength),
                          J9(true),
                          JC(1),
                          setTimeout(function () {
                            var cX = Number(QI.buffedStrength),
                              cZ = 40 * Math.PI,
                              cW = cZ - ((100 * cX) / 100 / 100) * cZ
                            JJ(''.concat(cZ))
                            JW(''.concat(cW))
                          }, 500))
                        : 0 === QI.buffedStrength &&
                          (JC(0),
                          Jg(false),
                          JJ('125.66370614359172'),
                          JW('125.66370614359172'),
                          setTimeout(function () {
                            J9(false)
                          }, 2000)))
                    : (JC(0),
                      Jg(false),
                      JJ('125.66370614359172'),
                      JW('125.66370614359172'),
                      setTimeout(function () {
                        J9(false)
                      }, 2000)),
                  void 0 !== QI.buffedJobpay &&
                    (true === QI.buffedJobpay
                      ? (Jv(true),
                        JN(1),
                        JD(true),
                        Jf(1),
                        setTimeout(function () {
                          var cX = 40 * Math.PI,
                            cZ = cX - 0.01 * cX
                          Jy(''.concat(cX))
                          JE(''.concat(cZ))
                        }, 500))
                      : false === QI.buffedJobpay &&
                        (Jf(0),
                        Jv(false),
                        Jy('125.66370614359172'),
                        JE('125.66370614359172'),
                        setTimeout(function () {
                          JD(false)
                        }, 2000))),
                  void 0 !== QI.buffedAlertness &&
                    (true === QI.buffedAlertness
                      ? (HM(true),
                        HW(1),
                        Hg(true),
                        HI(1),
                        setTimeout(function () {
                          var cX = 40 * Math.PI,
                            cZ = cX - 0.01 * cX
                          HP(''.concat(cX))
                          HK(''.concat(cZ))
                        }, 500))
                      : false === QI.buffedAlertness &&
                        (HI(0),
                        HM(false),
                        HP('125.66370614359172'),
                        HK('125.66370614359172'),
                        setTimeout(function () {
                          Hg(false)
                        }, 2000)))),
                'hud' === Qu)
              ) {
                if (
                  (void 0 !== QI.displayRadioChannel &&
                    Lq(QI.displayRadioChannel),
                  void 0 !== QI.displayAllForce &&
                    (true === QI.displayAllForce
                      ? (CF(true),
                        mK || (mA(true), mG(1), Ck(true)),
                        rf || (rR(true), rq(1), CX(true)),
                        kZ || (kW(true), kg(1), Cp(true)),
                        o4 || (o5(true), o9(1), Cx(true)),
                        oQ || (op(true), ox(1), Cw(true)),
                        oE || (oO(true), U1(1), CS(true)))
                      : (Cm &&
                          (mG(0),
                          setTimeout(function () {
                            mA(false)
                          }, 2000)),
                        CH &&
                          (rq(0),
                          setTimeout(function () {
                            rR(false)
                          }, 2000)),
                        CQ &&
                          (kg(0),
                          setTimeout(function () {
                            kW(false)
                          }, 2000)),
                        CB &&
                          (o9(0),
                          setTimeout(function () {
                            o5(false)
                          }, 2000)),
                        Cu &&
                          (ox(0),
                          setTimeout(function () {
                            op(false)
                          }, 2000)),
                        CP &&
                          (U1(0),
                          setTimeout(function () {
                            oO(false)
                          }, 2000)),
                        Ck(false),
                        CX(false),
                        Cp(false),
                        Cx(false),
                        Cw(false),
                        CS(false),
                        CF(false))),
                  void 0 !== QI.display)
                ) {
                  if ((Lg(QI.display), QI.display)) {
                    CE(true)
                    mF(1)
                    var QD = 40 * Math.PI,
                      Qz = QD - 0.66 * QD
                    mk(''.concat(QD))
                    mX(''.concat(Qz))
                  } else {
                    UU(false)
                    UZ(0)
                    UK(false)
                    UM(0)
                    J9(false)
                    JC(0)
                    JD(false)
                    Jf(0)
                    H5(false)
                    H9(0)
                    Hg(false)
                    HI(0)
                    X0(false)
                    X4(0)
                    XZ(false)
                    XV(0)
                    XM(false)
                    Xb(0)
                    Z9(false)
                    ZJ(0)
                  }
                }
                if (void 0 !== QI.voiceRange) {
                  var QP = 33
                  1 === QI.voiceRange
                    ? (QP = 33)
                    : 2 === QI.voiceRange
                    ? (QP = 66)
                    : 3 === QI.voiceRange && (QP = 100)
                  var QS = 40 * Math.PI,
                    Qf = QS - ((100 * QP) / 100 / 100) * QS
                  mk(''.concat(QS))
                  mX(''.concat(Qf))
                }
                if (void 0 !== QI.health) {
                  if (
                    (mp(QI.health),
                    setTimeout(function () {
                      var cW = Number(QI.health),
                        cQ = 40 * Math.PI,
                        cp = cQ - ((100 * cW) / 100 / 100) * cQ
                      mv(''.concat(cQ))
                      r3(''.concat(cp))
                      QI.health < 10 ? mS(true) : mS(false)
                    }, 500),
                    QI.health <= mB || 100 === mB)
                  ) {
                    ;((true === LE && QI.health <= mB) || 100 === mB) &&
                      (mA(true), mG(1))
                    false !== LE || CL || (mA(false), mG(0))
                  } else {
                    if ((100 === QI.health || QI.health > 100) && !CL) {
                      var QR = Number(QI.health),
                        QK = 40 * Math.PI,
                        QA = QK - ((100 * QR) / 100 / 100) * QK
                      mv(''.concat(QK))
                      r3(''.concat(QA))
                      mG(0)
                      mS(false)
                      setTimeout(function () {
                        mA(false)
                      }, 2000)
                    }
                  }
                }
                if (void 0 !== QI.armor) {
                  if (
                    (rW(QI.armor),
                    setTimeout(function () {
                      var cQ = Number(QI.armor),
                        cp = 40 * Math.PI,
                        cV = cp - ((100 * cQ) / 100 / 100) * cp
                      rO(''.concat(cp))
                      k1(''.concat(cV))
                      QI.armor < 10 ? rz(true) : rz(false)
                    }, 500),
                    QI.armor <= rV || 100 === rV)
                  ) {
                    ;((true === a0 && QI.armor <= rV) || 100 === rV) &&
                      (rR(true), rq(1))
                    false !== a0 || CL || (rR(false), rq(0))
                  } else {
                    if ((100 === QI.armor || QI.armor > 100) && !CL) {
                      var Qy = Number(QI.armor),
                        Qq = 40 * Math.PI,
                        QM = Qq - ((100 * Qy) / 100 / 100) * Qq
                      rO(''.concat(Qq))
                      k1(''.concat(QM))
                      rq(0)
                      rz(false)
                      setTimeout(function () {
                        rR(false)
                      }, 2000)
                    }
                  }
                }
                if (void 0 !== QI.hunger) {
                  if (
                    (k5(QI.hunger),
                    setTimeout(function () {
                      var cp = Number(QI.hunger),
                        cV = 40 * Math.PI,
                        cg = cV - ((100 * cp) / 100 / 100) * cV
                      kI(''.concat(cV))
                      kz(''.concat(cg))
                      QI.hunger < 10 ? kJ(true) : kJ(false)
                    }, 500),
                    Number(QI.hunger) <= k8 || 100 === k8)
                  ) {
                    ;((true === a4 && QI.hunger <= k8) || 100 === k8) &&
                      (kW(true), kg(1))
                    false !== a4 || CL || (kW(false), kg(0))
                  } else {
                    if ((100 === QI.hunger || QI.hunger > 100) && !CL && !TY) {
                      var QG = Number(QI.hunger),
                        QE = 40 * Math.PI,
                        QO = QE - ((100 * QG) / 100 / 100) * QE
                      kI(''.concat(QE))
                      kz(''.concat(QO))
                      kg(0)
                      kJ(false)
                      setTimeout(function () {
                        kW(false)
                      }, 2000)
                    }
                  }
                }
                if (void 0 !== QI.thirst) {
                  if (
                    (kR(QI.thirst),
                    setTimeout(function () {
                      var cp = Number(QI.thirst),
                        cV = 40 * Math.PI,
                        cg = cV - ((100 * cp) / 100 / 100) * cV
                      oC(''.concat(cV))
                      oJ(''.concat(cg))
                      QI.thirst < 10 ? o1(true) : o1(false)
                    }, 500),
                    QI.thirst <= ky || 100 === ky)
                  ) {
                    ;((true === a8 && QI.thirst <= ky) || 100 === ky) &&
                      (o5(true), o9(1))
                    false !== a8 || CL || (o5(false), o9(0))
                  } else {
                    if ((100 === QI.thirst || QI.thirst > 100) && !CL) {
                      var Qb = Number(QI.thirst),
                        QY = 40 * Math.PI,
                        Qv = QY - ((100 * Qb) / 100 / 100) * QY
                      oC(''.concat(QY))
                      oJ(''.concat(Qv))
                      o9(0)
                      o1(false)
                      setTimeout(function () {
                        o5(false)
                      }, 2000)
                    }
                  }
                }
                if (void 0 !== QI.oxygen) {
                  if (QI.oxygen < 25) {
                    true === aT && QI.oxygen < 25 && (op(true), ox(1))
                    false !== aT || CL || (op(false), ox(0))
                    setTimeout(function () {
                      var cp = Number(QI.oxygen),
                        cV = 40 * Math.PI,
                        cg = cV - ((100 * cp) / 100 / 100) * cV
                      ow(''.concat(cV))
                      oS(''.concat(cg))
                    }, 500)
                  } else {
                    if (QI.oxygen >= 25 && !CL) {
                      var c0 = Number(QI.oxygen),
                        c1 = 40 * Math.PI,
                        c2 = c1 - ((100 * c0) / 100 / 100) * c1
                      ow(''.concat(c1))
                      oS(''.concat(c2))
                      ox(0)
                      setTimeout(function () {
                        op(false)
                      }, 2000)
                    }
                  }
                }
                if (void 0 !== QI.stress) {
                  if ((oA(QI.stress), QI.stress >= 1)) {
                    true === aU && (oO(true), U1(1))
                    false !== aU || CL || (oO(false), U1(0))
                    setTimeout(function () {
                      var cp = Number(QI.stress),
                        cV = 40 * Math.PI,
                        cg = cV - ((100 * cp) / 100 / 100) * cV
                      U5(''.concat(cV))
                      U9(''.concat(cg))
                    }, 500)
                  } else {
                    if ((QI.stress <= 1 || 0 === QI.stress) && !CL) {
                      var c3 = Number(QI.stress),
                        c4 = 40 * Math.PI,
                        c5 = c4 - ((100 * c3) / 100 / 100) * c4
                      U5(''.concat(c4))
                      U9(''.concat(c5))
                      U1(0)
                      setTimeout(function () {
                        oO(false)
                      }, 2000)
                    }
                  }
                }
                if (void 0 !== QI.fuel) {
                  var c6 = Number(QI.fuel),
                    c7 = 27 * Math.PI,
                    c8 = -(c7 - ((145 * -((100 * c6) / 220)) / 100 / 100) * c7)
                  h5(''.concat(c7))
                  h9(''.concat(c8))
                  hy(c6)
                  hC('#fff')
                  c6 <= 15 && hC('red')
                }
                if (
                  (void 0 !== QI.altitudeShow && az(QI.altitudeShow),
                  void 0 !== QI.voiceActive &&
                    (true === QI.voiceActive
                      ? (Cv('rgb(213, 205, 49)'), m3(true))
                      : (Cv('#fff'), m3(false))),
                  void 0 !== QI.voiceActiveRadio &&
                    (true === QI.voiceActiveRadio
                      ? (Cv('#C05D5D'), m7(true))
                      : (Cv('#fff'), m7(false))),
                  void 0 !== QI.hasRadio && Lz(QI.hasRadio),
                  void 0 !== QI.carHudShow && ag(QI.carHudShow),
                  void 0 !== QI.waypointActive && aW(QI.waypointActive),
                  void 0 !== QI.waypointDistance &&
                    aq(QI.waypointDistance.toFixed(2).toString()),
                  void 0 !== QI.beltShow && aI(QI.beltShow),
                  void 0 !== QI.engineDamageShow && aR(QI.engineDamageShow),
                  void 0 !== QI.showWeaponFireRate &&
                    (true === QI.showWeaponFireRate
                      ? (WV(true), WN(1))
                      : (WN(0),
                        setTimeout(function () {
                          WV(false)
                        }, 2000))),
                  void 0 !== QI.pursuit)
                ) {
                  var c9 = 0
                  1 === QI.pursuit
                    ? (c9 = 35)
                    : 2 === QI.pursuit
                    ? (c9 = 65)
                    : 3 === QI.pursuit && (c9 = 100)
                  var cL = 40 * Math.PI,
                    cF = cL - ((100 * c9) / 100 / 100) * cL
                  ZW(''.concat(cL))
                  Zg(''.concat(cF))
                }
                void 0 !== QI.pursuitShow &&
                  (true === QI.pursuitShow && true === TP
                    ? (ZC(true), Z9(true), ZJ(1))
                    : (ZJ(0),
                      setTimeout(function () {
                        ZC(false)
                        Z9(false)
                      }, 2000)))
                QI.harnessShow
              } else {
                if ('game' === Qu) {
                  void 0 !== QI.modeDev &&
                    (true === QI.modeDev
                      ? (QH(QI.modeDev), QQ(1))
                      : (QQ(0),
                        setTimeout(function () {
                          QH(QI.modeDev)
                        }, 2000)))
                  void 0 !== QI.modeGod &&
                    (true === QI.modeGod ? FA(true) : FA(false))
                  void 0 !== QI.inVehicle && TS(QI.inVehicle)
                  void 0 !== QI.radioChannel && LR(QI.radioChannel)
                } else {
                  if ('hud.compass' === Qu) {
                    if (
                      (void 0 !== QI.showCompass && Fw(QI.showCompass),
                      void 0 !== QI.showRoadNames && FS(QI.showRoadNames),
                      void 0 !== QI.alt)
                    ) {
                      var cT = Number(QI.alt),
                        cC = 54 * Math.PI,
                        cm = -(
                          cC -
                          ((50 * -((100 * cT) / 220)) / 100 / 100) * cC
                        )
                      hJ(''.concat(cC, ' ').concat(cC))
                      hW(''.concat(cm))
                      hE(cT)
                    }
                    if (
                      (void 0 !== QI.area && hg(QI.area),
                      void 0 !== QI.street && hI(QI.street),
                      void 0 !== QI.heading)
                    ) {
                      var ck = Number(QI.heading) + 90
                      360 === QI.heading ? hz(0) : hz(-ck)
                    }
                    if (void 0 !== QI.speed) {
                      var cU = Number(QI.speed),
                        cJ = 54 * Math.PI,
                        cH = -(
                          cJ -
                          ((50 * -((100 * cU) / 220)) / 100 / 100) * cJ
                        )
                      aO(''.concat(cJ, ' ').concat(cJ))
                      h1(''.concat(cH))
                      hR(cU)
                    }
                  }
                }
              }
            }),
            E('toggleSettings', function (Qx) {
              Qx.show && (Tw(0), LI(true))
            }),
            Object(Z.useEffect)(function () {
              window.invokeNative ||
                (CE(true),
                mF(1),
                setTimeout(function () {
                  var QN = 40 * Math.PI,
                    QI = -(QN - 1 * QN)
                  mk(''.concat(QN))
                  mX(''.concat(QI))
                }, 500))
            }),
            (function (Qx) {
              var QI = Object(Z.useRef)(G)
              Object(Z.useEffect)(
                function () {
                  QI.current = Qx
                },
                [Qx]
              )
              Object(Z.useEffect)(function () {
                var QD = function (Qz) {
                  L4.includes(Qz.code) && (QI.current(false), L2('hideFrame'))
                }
                return (
                  window.addEventListener('keydown', QD),
                  function () {
                    return window.removeEventListener('keydown', QD)
                  }
                )
              }, [])
            })(LI),
            Object(Lk.jsxs)(Lk.Fragment, {
              children: [
                Object(Lk.jsx)(L5.a, {
                  container: true,
                  className: LW.root,
                  style: {
                    display: F7 ? '' : 'none',
                    zIndex: 1000000,
                  },
                  children: Object(Lk.jsxs)('div', {
                    style: {
                      display: 'flex',
                      width: '100vw',
                      height: '100vh',
                      position: 'absolute',
                      left: '0px',
                      top: '0px',
                      flexDirection: 'column',
                    },
                    children: [
                      Object(Lk.jsx)('div', {
                        style: {
                          backgroundColor: 'black',
                          height: ''.concat(
                            Number(FB) >= 40 ? '40vh' : ''.concat(FB, 'vh')
                          ),
                          width: '100vw',
                        },
                      }),
                      Object(Lk.jsx)('div', {
                        style: {
                          flex: '1 1 0%',
                          width: '100vw',
                          height: '100%',
                        },
                      }),
                      Object(Lk.jsx)('div', {
                        style: {
                          backgroundColor: 'black',
                          height: ''.concat(
                            Number(FB) >= 40 ? '40vh' : ''.concat(FB, 'vh')
                          ),
                          width: '100vw',
                        },
                      }),
                    ],
                  }),
                }),
                Object(Lk.jsx)(L5.a, {
                  container: true,
                  className: LW.root,
                  children: Object(Lk.jsx)('div', {
                    className: 'hud.compass-app-wrapper',
                    style: {
                      display: Fu && hv ? 'flex' : 'none',
                      position: 'absolute',
                      top: '0px',
                      left: '0px',
                      width: '100vw',
                      height: '32px',
                      pointerEvents: 'none',
                      placeContent: 'center',
                      color: 'white',
                    },
                    children: Object(Lk.jsx)('div', {
                      style: {
                        width: '100vw',
                        height: '52px',
                        display: 'flex',
                        justifyContent: 'unset',
                        flexDirection: 'column',
                      },
                      children: Object(Lk.jsxs)('div', {
                        style: {
                          width: '100vw',
                          height: '32px',
                          display: 'flex',
                          justifyContent: 'center',
                        },
                        children: [
                          Object(Lk.jsx)('div', {
                            style: {
                              flex: '1 1 0%',
                              display: 'flex',
                              justifyContent: 'center',
                              alignItems: 'center',
                              margin: '0px 16px',
                              textAlign: 'right',
                              opacity: FP ? '1' : '0',
                            },
                            children: Object(Lk.jsx)(L6.a, {
                              style: {
                                textShadow:
                                  'rgb(55, 71, 79) -1px 1px 0px, rgb(55, 71, 79) 1px 1px 0px, rgb(55, 71, 79) 1px -1px 0px, rgb(55, 71, 79) -1px -1px 0px',
                                fontFamily: 'Arial, Helvetica, sans-serif',
                                letterSpacing: '0px',
                                fontWeight: 600,
                                textDecoration: 'none',
                                fontStyle: 'normal',
                                fontVariant: 'small-caps',
                                textTransform: 'none',
                                width: '100%',
                              },
                              variant: 'body1',
                              gutterBottom: true,
                              children: hV,
                            }),
                          }),
                          Object(Lk.jsx)('div', {
                            style: {
                              width: '180px',
                              position: 'relative',
                              overflow: 'hidden',
                              backgroundImage:
                                'url(https://gta-assets.nopixel.net/images/compass.png)',
                              backgroundRepeat: 'repeat',
                              backgroundSize: '360px 32px',
                              display: 'flex',
                              justifyContent: 'center',
                              backgroundPositionX: hD,
                            },
                            children: Object(Lk.jsx)('img', {
                              src: 'https://gta-assets.nopixel.net/images/compass-marker.png',
                              alt: '',
                              style: { height: '12px' },
                            }),
                          }),
                          Object(Lk.jsx)('div', {
                            style: {
                              flex: '1 1 0%',
                              display: 'flex',
                              justifyContent: 'center',
                              alignItems: 'center',
                              margin: '0px 16px',
                              textAlign: 'left',
                              opacity: FP && F3 ? '1' : '0',
                            },
                            children: Object(Lk.jsx)(L6.a, {
                              style: {
                                textShadow:
                                  'rgb(55, 71, 79) -1px 1px 0px, rgb(55, 71, 79) 1px 1px 0px, rgb(55, 71, 79) 1px -1px 0px, rgb(55, 71, 79) -1px -1px 0px',
                                fontFamily: 'Arial, Helvetica, sans-serif',
                                letterSpacing: '0px',
                                fontWeight: 600,
                                textDecoration: 'none',
                                fontStyle: 'normal',
                                fontVariant: 'small-caps',
                                textTransform: 'none',
                                width: '100%',
                              },
                              variant: 'body1',
                              gutterBottom: true,
                              children: hN,
                            }),
                          }),
                        ],
                      }),
                    }),
                  }),
                }),
                Object(Lk.jsx)(L5.a, {
                  container: true,
                  className: LW.root,
                  style: {
                    display: LN ? '' : 'none',
                    justifyContent: 'center',
                    alignItems: 'center',
                  },
                  children: Object(Lk.jsxs)('div', {
                    className: 'hud-settings-container',
                    children: [
                      Object(Lk.jsxs)('div', {
                        className: 'hud-settings-sidebar',
                        children: [
                          Object(Lk.jsx)('div', {
                            onClick: function () {
                              return Tw(1)
                            },
                            className: 'hud-settings-sidebar-tab',
                            style: {
                              backgroundColor:
                                1 === Tu
                                  ? 'rgb(34, 40, 49)'
                                  : 'rgb(48, 71, 94)',
                            },
                            children: Object(Lk.jsx)(L6.a, {
                              style: {
                                color: '#fff',
                                wordBreak: 'break-word',
                              },
                              variant: 'body1',
                              gutterBottom: true,
                              children: 'HUD',
                            }),
                          }),
                          Object(Lk.jsx)('div', {
                            onClick: function () {
                              return Tw(2)
                            },
                            className: 'hud-settings-sidebar-tab null',
                            style: {
                              backgroundColor:
                                2 === Tu
                                  ? 'rgb(34, 40, 49)'
                                  : 'rgb(48, 71, 94)',
                            },
                            children: Object(Lk.jsx)(L6.a, {
                              style: {
                                color: '#fff',
                                wordBreak: 'break-word',
                              },
                              variant: 'body1',
                              gutterBottom: true,
                              children: 'Phone',
                            }),
                          }),
                        ],
                      }),
                      Object(Lk.jsxs)('div', {
                        className: 'hud-settings-body',
                        children: [
                          Object(Lk.jsxs)('div', {
                            className: 'hud-settings-hud-container',
                            style: { display: 1 === Tu ? 'flex' : 'none' },
                            children: [
                              Object(Lk.jsx)('div', {
                                children: Object(Lk.jsxs)('div', {
                                  className: 'hud-row-double',
                                  children: [
                                    Object(Lk.jsx)(L6.a, {
                                      style: {
                                        color: '#fff',
                                        wordBreak: 'break-word',
                                      },
                                      variant: 'h6',
                                      gutterBottom: true,
                                      children: 'Settings',
                                    }),
                                    Object(Lk.jsx)('div', {
                                      style: {
                                        display: 'flex',
                                        justifyContent: 'flex-end',
                                      },
                                      children: Object(Lk.jsx)('div', {
                                        children: Object(Lk.jsx)(L7.a, {
                                          onClick: Cf,
                                          size: 'small',
                                          color: 'success',
                                          variant: 'contained',
                                          children: 'Save',
                                        }),
                                      }),
                                    }),
                                  ],
                                }),
                              }),
                              Object(Lk.jsxs)('div', {
                                children: [
                                  Object(Lk.jsx)(L6.a, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'h6',
                                    gutterBottom: true,
                                    children: 'Misc',
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsx)(L8.a, {
                                      className: 'jss255',
                                      children: Object(Lk.jsx)(L9.a, {
                                        control: Object(Lk.jsx)(LL.a, {
                                          color: 'warning',
                                          checked: FF,
                                          onChange: function (Qx) {
                                            return FT(Qx.target.checked)
                                          },
                                        }),
                                        label: 'Enable Circle Taskbar',
                                      }),
                                    }),
                                  }),
                                ],
                              }),
                              Object(Lk.jsx)('hr', {}),
                              Object(Lk.jsxs)('div', {
                                children: [
                                  Object(Lk.jsx)(L6.a, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'h6',
                                    gutterBottom: true,
                                    children: 'Status',
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsxs)('div', {
                                      className: 'hud-row-double',
                                      children: [
                                        Object(Lk.jsx)('div', {
                                          style: { maxWidth: '35%' },
                                          children: Object(Lk.jsx)(L8.a, {
                                            className: 'jss255',
                                            children: Object(Lk.jsx)(L9.a, {
                                              control: Object(Lk.jsx)(LL.a, {
                                                color: 'warning',
                                                checked: LE,
                                                onChange: function (Qx) {
                                                  true === Qx.target.checked
                                                    ? (LO(true),
                                                      mA(true),
                                                      mG(1))
                                                    : (LO(false),
                                                      mG(0),
                                                      setTimeout(function () {
                                                        mA(false)
                                                      }, 2000))
                                                },
                                              }),
                                              label: 'Show Health',
                                            }),
                                          }),
                                        }),
                                        Object(Lk.jsx)('div', {
                                          className: 'input-wrapper',
                                          style: { display: LE ? '' : 'none' },
                                          children: Object(Lk.jsx)(La.a, {
                                            fullWidth: true,
                                            sx: { width: '100%' },
                                            children: Object(Lk.jsx)(Lh.a, {
                                              sx: {
                                                '& .MuiInput-root': {
                                                  color: 'white !important',
                                                },
                                                '& label.Mui-focused': {
                                                  color: 'darkgray !important',
                                                },
                                                '& Mui-focused': {
                                                  color: 'darkgray !important',
                                                },
                                                '& .MuiInput-underline:hover:not(.Mui-disabled):before':
                                                  {
                                                    borderColor:
                                                      'darkgray !important',
                                                  },
                                                '& .MuiInput-underline:before':
                                                  {
                                                    borderColor:
                                                      'darkgray !important',
                                                    color:
                                                      'darkgray !important',
                                                  },
                                                '& .MuiInput-underline:after': {
                                                  borderColor:
                                                    'white !important',
                                                  color: 'darkgray !important',
                                                },
                                                '& .Mui-focused:after': {
                                                  color: 'darkgray !important',
                                                },
                                                '& .MuiInputAdornment-root': {
                                                  color: 'darkgray !important',
                                                },
                                              },
                                              id: 'input-with-icon-textfield',
                                              label:
                                                'Hide when more than... (100 = never hide)',
                                              variant: 'standard',
                                              value: mu,
                                              onChange: function (Qx) {
                                                return mw(
                                                  Number(Qx.target.value)
                                                )
                                              },
                                              onKeyDown: function (Qx) {
                                                return CR(Qx, true)
                                              },
                                              InputProps: {
                                                startAdornment: Object(Lk.jsx)(
                                                  LF.a,
                                                  {
                                                    position: 'start',
                                                    children: Object(Lk.jsx)(
                                                      'i',
                                                      {
                                                        className:
                                                          'fas fa-percent',
                                                      }
                                                    ),
                                                  }
                                                ),
                                              },
                                            }),
                                          }),
                                        }),
                                      ],
                                    }),
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsxs)('div', {
                                      className: 'hud-row-double',
                                      children: [
                                        Object(Lk.jsx)('div', {
                                          style: { maxWidth: '35%' },
                                          children: Object(Lk.jsx)(L8.a, {
                                            className: 'jss255',
                                            children: Object(Lk.jsx)(L9.a, {
                                              control: Object(Lk.jsx)(LL.a, {
                                                color: 'warning',
                                                checked: a0,
                                                onChange: function (Qx) {
                                                  true === Qx.target.checked
                                                    ? (a1(true),
                                                      rR(true),
                                                      rq(1))
                                                    : (a1(false),
                                                      rq(0),
                                                      setTimeout(function () {
                                                        rR(false)
                                                        a1(false)
                                                      }, 2000))
                                                },
                                              }),
                                              label: 'Show Armor',
                                            }),
                                          }),
                                        }),
                                        Object(Lk.jsx)('div', {
                                          className: 'input-wrapper',
                                          style: { display: a0 ? '' : 'none' },
                                          children: Object(Lk.jsx)(La.a, {
                                            fullWidth: true,
                                            sx: { width: '100%' },
                                            children: Object(Lk.jsx)(Lh.a, {
                                              sx: {
                                                '& .MuiInput-root': {
                                                  color: 'white !important',
                                                },
                                                '& label.Mui-focused': {
                                                  color: 'darkgray !important',
                                                },
                                                '& Mui-focused': {
                                                  color: 'darkgray !important',
                                                },
                                                '& .MuiInput-underline:hover:not(.Mui-disabled):before':
                                                  {
                                                    borderColor:
                                                      'darkgray !important',
                                                  },
                                                '& .MuiInput-underline:before':
                                                  {
                                                    borderColor:
                                                      'darkgray !important',
                                                    color:
                                                      'darkgray !important',
                                                  },
                                                '& .MuiInput-underline:after': {
                                                  borderColor:
                                                    'white !important',
                                                  color: 'darkgray !important',
                                                },
                                                '& .Mui-focused:after': {
                                                  color: 'darkgray !important',
                                                },
                                                '& .MuiInputAdornment-root': {
                                                  color: 'darkgray !important',
                                                },
                                              },
                                              id: 'input-with-icon-textfield',
                                              label:
                                                'Hide when more than... (100 = never hide)',
                                              variant: 'standard',
                                              value: rN,
                                              onChange: function (Qx) {
                                                return rI(
                                                  Number(Qx.target.value)
                                                )
                                              },
                                              onKeyDown: function (Qx) {
                                                return CK(Qx, true)
                                              },
                                              InputProps: {
                                                startAdornment: Object(Lk.jsx)(
                                                  LF.a,
                                                  {
                                                    position: 'start',
                                                    children: Object(Lk.jsx)(
                                                      'i',
                                                      {
                                                        className:
                                                          'fas fa-percent',
                                                      }
                                                    ),
                                                  }
                                                ),
                                              },
                                            }),
                                          }),
                                        }),
                                      ],
                                    }),
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsxs)('div', {
                                      className: 'hud-row-double',
                                      children: [
                                        Object(Lk.jsx)('div', {
                                          style: { maxWidth: '35%' },
                                          children: Object(Lk.jsx)(L8.a, {
                                            className: 'jss255',
                                            children: Object(Lk.jsx)(L9.a, {
                                              control: Object(Lk.jsx)(LL.a, {
                                                color: 'warning',
                                                checked: a4,
                                                onChange: function (Qx) {
                                                  true === Qx.target.checked
                                                    ? (a5(true),
                                                      kW(true),
                                                      kg(1))
                                                    : (a5(false),
                                                      kg(0),
                                                      setTimeout(function () {
                                                        kW(false)
                                                      }, 2000))
                                                },
                                              }),
                                              label: 'Show Food',
                                            }),
                                          }),
                                        }),
                                        Object(Lk.jsx)('div', {
                                          className: 'input-wrapper',
                                          style: { display: a4 ? '' : 'none' },
                                          children: Object(Lk.jsx)(La.a, {
                                            fullWidth: true,
                                            sx: { width: '100%' },
                                            children: Object(Lk.jsx)(Lh.a, {
                                              sx: {
                                                '& .MuiInput-root': {
                                                  color: 'white !important',
                                                },
                                                '& label.Mui-focused': {
                                                  color: 'darkgray !important',
                                                },
                                                '& Mui-focused': {
                                                  color: 'darkgray !important',
                                                },
                                                '& .MuiInput-underline:hover:not(.Mui-disabled):before':
                                                  {
                                                    borderColor:
                                                      'darkgray !important',
                                                  },
                                                '& .MuiInput-underline:before':
                                                  {
                                                    borderColor:
                                                      'darkgray !important',
                                                    color:
                                                      'darkgray !important',
                                                  },
                                                '& .MuiInput-underline:after': {
                                                  borderColor:
                                                    'white !important',
                                                  color: 'darkgray !important',
                                                },
                                                '& .Mui-focused:after': {
                                                  color: 'darkgray !important',
                                                },
                                                '& .MuiInputAdornment-root': {
                                                  color: 'darkgray !important',
                                                },
                                              },
                                              id: 'input-with-icon-textfield',
                                              label:
                                                'Hide when more than... (100 = never hide)',
                                              variant: 'standard',
                                              value: kT,
                                              onChange: function (Qx) {
                                                return kC(
                                                  Number(Qx.target.value)
                                                )
                                              },
                                              onKeyDown: function (Qx) {
                                                return CA(Qx, true)
                                              },
                                              InputProps: {
                                                startAdornment: Object(Lk.jsx)(
                                                  LF.a,
                                                  {
                                                    position: 'start',
                                                    children: Object(Lk.jsx)(
                                                      'i',
                                                      {
                                                        className:
                                                          'fas fa-percent',
                                                      }
                                                    ),
                                                  }
                                                ),
                                              },
                                            }),
                                          }),
                                        }),
                                      ],
                                    }),
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsxs)('div', {
                                      className: 'hud-row-double',
                                      children: [
                                        Object(Lk.jsx)('div', {
                                          style: { maxWidth: '35%' },
                                          children: Object(Lk.jsx)(L8.a, {
                                            className: 'jss255',
                                            children: Object(Lk.jsx)(L9.a, {
                                              control: Object(Lk.jsx)(LL.a, {
                                                color: 'warning',
                                                checked: a8,
                                                onChange: function (Qx) {
                                                  true === Qx.target.checked
                                                    ? (a9(true),
                                                      o5(true),
                                                      o9(1))
                                                    : (a9(false),
                                                      o9(0),
                                                      setTimeout(function () {
                                                        o5(false)
                                                      }, 2000))
                                                },
                                              }),
                                              label: 'Show Water',
                                            }),
                                          }),
                                        }),
                                        Object(Lk.jsx)('div', {
                                          className: 'input-wrapper',
                                          style: { display: a8 ? '' : 'none' },
                                          children: Object(Lk.jsx)(La.a, {
                                            fullWidth: true,
                                            sx: { width: '100%' },
                                            children: Object(Lk.jsx)(Lh.a, {
                                              sx: {
                                                '& .MuiInput-root': {
                                                  color: 'white !important',
                                                },
                                                '& label.Mui-focused': {
                                                  color: 'darkgray !important',
                                                },
                                                '& Mui-focused': {
                                                  color: 'darkgray !important',
                                                },
                                                '& .MuiInput-underline:hover:not(.Mui-disabled):before':
                                                  {
                                                    borderColor:
                                                      'darkgray !important',
                                                  },
                                                '& .MuiInput-underline:before':
                                                  {
                                                    borderColor:
                                                      'darkgray !important',
                                                    color:
                                                      'darkgray !important',
                                                  },
                                                '& .MuiInput-underline:after': {
                                                  borderColor:
                                                    'white !important',
                                                  color: 'darkgray !important',
                                                },
                                                '& .Mui-focused:after': {
                                                  color: 'darkgray !important',
                                                },
                                                '& .MuiInputAdornment-root': {
                                                  color: 'darkgray !important',
                                                },
                                              },
                                              id: 'input-with-icon-textfield',
                                              label:
                                                'Hide when more than... (100 = never hide)',
                                              variant: 'standard',
                                              value: kE,
                                              onChange: function (Qx) {
                                                return kO(
                                                  Number(Qx.target.value)
                                                )
                                              },
                                              onKeyDown: function (Qx) {
                                                return Cy(Qx, true)
                                              },
                                              InputProps: {
                                                startAdornment: Object(Lk.jsx)(
                                                  LF.a,
                                                  {
                                                    position: 'start',
                                                    children: Object(Lk.jsx)(
                                                      'i',
                                                      {
                                                        className:
                                                          'fas fa-percent',
                                                      }
                                                    ),
                                                  }
                                                ),
                                              },
                                            }),
                                          }),
                                        }),
                                      ],
                                    }),
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsxs)('div', {
                                      className: 'hud-row-double',
                                      children: [
                                        Object(Lk.jsx)(L8.a, {
                                          className: 'jss255',
                                          children: Object(Lk.jsx)(L9.a, {
                                            control: Object(Lk.jsx)(LL.a, {
                                              color: 'warning',
                                              checked: aU,
                                              onChange: function (Qx) {
                                                true === Qx.target.checked
                                                  ? (aJ(true), oO(true), U1(1))
                                                  : (aJ(false),
                                                    U1(0),
                                                    setTimeout(function () {
                                                      oO(false)
                                                    }, 2000))
                                              },
                                            }),
                                            label: 'Show Stress when relevant',
                                          }),
                                        }),
                                        Object(Lk.jsx)(L8.a, {
                                          className: 'jss255',
                                          children: Object(Lk.jsx)(L9.a, {
                                            control: Object(Lk.jsx)(LL.a, {
                                              color: 'warning',
                                              checked: aT,
                                              onChange: function (Qx) {
                                                true === Qx.target.checked
                                                  ? (aC(true), op(true), ox(1))
                                                  : (aC(false),
                                                    ox(0),
                                                    setTimeout(function () {
                                                      op(false)
                                                    }, 2000))
                                              },
                                            }),
                                            label: 'Show Oxygen when relevant',
                                          }),
                                        }),
                                        Object(Lk.jsx)(L8.a, {
                                          className: 'jss255',
                                          children: Object(Lk.jsx)(L9.a, {
                                            control: Object(Lk.jsx)(LL.a, {
                                              color: 'warning',
                                              checked: Fk,
                                              onChange: function (Qx) {
                                                true === Qx.target.checked
                                                  ? (FU(true),
                                                    TY &&
                                                      kZ &&
                                                      k4 >= k8 &&
                                                      (kg(0),
                                                      setTimeout(function () {
                                                        kW(false)
                                                      }, 2000)),
                                                    C2 &&
                                                      oE &&
                                                      oK <= 1 &&
                                                      (U1(0),
                                                      setTimeout(function () {
                                                        oO(false)
                                                      }, 2000)))
                                                  : (FU(false),
                                                    TY &&
                                                      (kZ || (kW(true), kg(1))),
                                                    C2 &&
                                                      (oE || (oO(true), U1(1))))
                                              },
                                            }),
                                            label: 'Hide Enhancements',
                                          }),
                                        }),
                                      ],
                                    }),
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsxs)(La.a, {
                                      className: 'formControlClass',
                                      variant: 'standard',
                                      fullWidth: true,
                                      children: [
                                        Object(Lk.jsx)(LT.a, {
                                          id: 'demo-simple-select-label',
                                          children: 'Radio Channel Visibility',
                                        }),
                                        Object(Lk.jsxs)(LC.a, {
                                          labelId: 'demo-simple-select-label',
                                          id: 'demo-simple-select',
                                          label: 'Radio Channel Visibility',
                                          defaultValue: '3',
                                          value: TK,
                                          onChange: function (Qx) {
                                            return TA(Qx.target.value)
                                          },
                                          children: [
                                            Object(Lk.jsx)(Lm.a, {
                                              value: '1',
                                              children: 'Never',
                                            }),
                                            Object(Lk.jsx)(Lm.a, {
                                              value: '2',
                                              children: 'Always',
                                            }),
                                            Object(Lk.jsx)(Lm.a, {
                                              value: '3',
                                              children: 'Relevant',
                                            }),
                                          ],
                                        }),
                                      ],
                                    }),
                                  }),
                                ],
                              }),
                              Object(Lk.jsx)('hr', {}),
                              Object(Lk.jsxs)('div', {
                                children: [
                                  Object(Lk.jsx)(L6.a, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'h6',
                                    gutterBottom: true,
                                    children: 'Vehicle',
                                  }),
                                  Object(Lk.jsxs)('div', {
                                    className: 'hud-row',
                                    children: [
                                      Object(Lk.jsx)('div', {
                                        className: 'jss1417 hud-row-double',
                                        children: Object(Lk.jsx)('div', {
                                          children: Object(Lk.jsx)(L8.a, {
                                            className: 'jss255',
                                            children: Object(Lk.jsx)(L9.a, {
                                              control: Object(Lk.jsx)(LL.a, {
                                                color: 'warning',
                                                checked: FM,
                                                onChange: function (Qx) {
                                                  return FG(Qx.target.checked)
                                                },
                                              }),
                                              label: 'Minimap Enabled',
                                            }),
                                          }),
                                        }),
                                      }),
                                      Object(Lk.jsx)('div', {
                                        className: 'jss1418 hud-row',
                                        children: Object(Lk.jsx)(L8.a, {
                                          className: 'jss255',
                                          children: Object(Lk.jsx)(L9.a, {
                                            control: Object(Lk.jsx)(LL.a, {
                                              color: 'warning',
                                              checked: FY,
                                              onChange: function (Qx) {
                                                return Fv(Qx.target.checked)
                                              },
                                            }),
                                            label:
                                              'Use Default Minimap (may require game restart)',
                                          }),
                                        }),
                                      }),
                                      Object(Lk.jsx)('div', {
                                        className: 'jss1418 hud-row',
                                        children: Object(Lk.jsx)(L8.a, {
                                          className: 'jss255',
                                          children: Object(Lk.jsx)(L9.a, {
                                            control: Object(Lk.jsx)(LL.a, {
                                              color: 'warning',
                                              checked: T2,
                                              onChange: function (Qx) {
                                                return T3(Qx.target.checked)
                                              },
                                            }),
                                            label: 'Show Minimap Outline',
                                          }),
                                        }),
                                      }),
                                    ],
                                  }),
                                ],
                              }),
                              Object(Lk.jsx)('hr', {}),
                              Object(Lk.jsxs)('div', {
                                children: [
                                  Object(Lk.jsx)(L6.a, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'h6',
                                    gutterBottom: true,
                                    children: 'Compass',
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsxs)('div', {
                                      className: 'jss1417 hud-inner-row',
                                      children: [
                                        Object(Lk.jsxs)('div', {
                                          children: [
                                            Object(Lk.jsx)(L8.a, {
                                              className: 'jss255',
                                              children: Object(Lk.jsx)(L9.a, {
                                                control: Object(Lk.jsx)(LL.a, {
                                                  color: 'warning',
                                                  checked: hv,
                                                  onChange: function (Qx) {
                                                    return F0(Qx.target.checked)
                                                  },
                                                }),
                                                label: 'Enabled',
                                              }),
                                            }),
                                            Object(Lk.jsx)(L6.a, {
                                              style: {
                                                color: '#fff',
                                                wordBreak: 'break-word',
                                              },
                                              variant: 'body2',
                                              gutterBottom: true,
                                              children:
                                                'Disabling the compass entirely can vastly improve performance',
                                            }),
                                          ],
                                        }),
                                        Object(Lk.jsxs)('div', {
                                          style: { display: hv ? '' : 'none' },
                                          children: [
                                            Object(Lk.jsxs)(La.a, {
                                              className: 'formControlClass',
                                              variant: 'standard',
                                              fullWidth: true,
                                              children: [
                                                Object(Lk.jsx)(LT.a, {
                                                  id: 'demo-simple-select-label',
                                                  children: 'Compass FPS',
                                                }),
                                                Object(Lk.jsxs)(LC.a, {
                                                  labelId:
                                                    'demo-simple-select-label',
                                                  id: 'demo-simple-select',
                                                  label: 'Compass FPS',
                                                  defaultValue: '16',
                                                  value: FX,
                                                  onChange: function (Qx) {
                                                    return FZ(Qx.target.value)
                                                  },
                                                  children: [
                                                    Object(Lk.jsx)(Lm.a, {
                                                      value: '64',
                                                      children: '15',
                                                    }),
                                                    Object(Lk.jsx)(Lm.a, {
                                                      value: '32',
                                                      children: '30',
                                                    }),
                                                    Object(Lk.jsx)(Lm.a, {
                                                      value: '24',
                                                      children: '45',
                                                    }),
                                                    Object(Lk.jsx)(Lm.a, {
                                                      value: '16',
                                                      children: '60',
                                                    }),
                                                  ],
                                                }),
                                              ],
                                            }),
                                            Object(Lk.jsx)(L6.a, {
                                              style: {
                                                color: '#fff',
                                                wordBreak: 'break-word',
                                              },
                                              variant: 'body2',
                                              gutterBottom: true,
                                              children:
                                                'The higher the FPS, the more demanding this is on your machine',
                                            }),
                                          ],
                                        }),
                                      ],
                                    }),
                                  }),
                                  Object(Lk.jsxs)('div', {
                                    className: 'hud-row',
                                    children: [
                                      Object(Lk.jsx)(L8.a, {
                                        className: 'jss255',
                                        children: Object(Lk.jsx)(L9.a, {
                                          control: Object(Lk.jsx)(LL.a, {
                                            color: 'warning',
                                            checked: F3,
                                            onChange: function (Qx) {
                                              return F4(Qx.target.checked)
                                            },
                                          }),
                                          label:
                                            'Show street names when in a vehicle',
                                        }),
                                      }),
                                      Object(Lk.jsx)(L6.a, {
                                        style: {
                                          color: '#fff',
                                          wordBreak: 'break-word',
                                        },
                                        variant: 'body2',
                                        gutterBottom: true,
                                        children:
                                          'Disabling this can help improve performance',
                                      }),
                                    ],
                                  }),
                                ],
                              }),
                              Object(Lk.jsx)('hr', {}),
                              Object(Lk.jsxs)('div', {
                                children: [
                                  Object(Lk.jsx)(L6.a, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'h6',
                                    gutterBottom: true,
                                    children: 'Black Bars',
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsx)(L8.a, {
                                      className: 'jss255',
                                      children: Object(Lk.jsx)(L9.a, {
                                        control: Object(Lk.jsx)(LL.a, {
                                          color: 'warning',
                                          checked: F7,
                                          onChange: function (Qx) {
                                            return F8(Qx.target.checked)
                                          },
                                        }),
                                        label: 'Enabled',
                                      }),
                                    }),
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsx)('div', {
                                      className: 'input-wrapper',
                                      children: Object(Lk.jsx)(La.a, {
                                        fullWidth: true,
                                        sx: { width: '100%' },
                                        children: Object(Lk.jsx)(Lh.a, {
                                          sx: {
                                            '& .MuiInput-root': {
                                              color: 'white !important',
                                            },
                                            '& label.Mui-focused': {
                                              color: 'darkgray !important',
                                            },
                                            '& Mui-focused': {
                                              color: 'darkgray !important',
                                            },
                                            '& .MuiInput-underline:hover:not(.Mui-disabled):before':
                                              {
                                                borderColor:
                                                  'darkgray !important',
                                              },
                                            '& .MuiInput-underline:before': {
                                              borderColor:
                                                'darkgray !important',
                                              color: 'darkgray !important',
                                            },
                                            '& .MuiInput-underline:after': {
                                              borderColor: 'white !important',
                                              color: 'darkgray !important',
                                            },
                                            '& .Mui-focused:after': {
                                              color: 'darkgray !important',
                                            },
                                            '& .MuiInputAdornment-root': {
                                              color: 'darkgray !important',
                                            },
                                          },
                                          id: 'input-with-icon-textfield',
                                          label: 'Percentage of screen',
                                          variant: 'standard',
                                          value: FB,
                                          onChange: function (Qx) {
                                            return Fx(Qx.target.value)
                                          },
                                          InputProps: {
                                            startAdornment: Object(Lk.jsx)(
                                              LF.a,
                                              {
                                                position: 'start',
                                                children: Object(Lk.jsx)('i', {
                                                  className:
                                                    'fas fa-mask fa-w-20 fa-fw',
                                                }),
                                              }
                                            ),
                                          },
                                        }),
                                      }),
                                    }),
                                  }),
                                ],
                              }),
                              Object(Lk.jsx)('hr', {}),
                              Object(Lk.jsxs)('div', {
                                children: [
                                  Object(Lk.jsx)(L6.a, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'h6',
                                    gutterBottom: true,
                                    children: 'Crosshair',
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsx)(L8.a, {
                                      className: 'jss255',
                                      children: Object(Lk.jsx)(L9.a, {
                                        control: Object(Lk.jsx)(LL.a, {
                                          color: 'warning',
                                        }),
                                        label: 'Enabled',
                                      }),
                                    }),
                                  }),
                                ],
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: 'hud-settings-phone-container',
                            style: { display: 2 === Tu ? 'flex' : 'none' },
                            children: [
                              Object(Lk.jsxs)('div', {
                                children: [
                                  Object(Lk.jsxs)('div', {
                                    className: 'hud-row-double',
                                    children: [
                                      Object(Lk.jsx)(L6.a, {
                                        style: {
                                          color: '#fff',
                                          wordBreak: 'break-word',
                                        },
                                        variant: 'h6',
                                        gutterBottom: true,
                                        children: 'Misc',
                                      }),
                                      Object(Lk.jsx)('div', {
                                        style: {
                                          display: 'flex',
                                          justifyContent: 'flex-end',
                                        },
                                        children: Object(Lk.jsx)('div', {
                                          children: Object(Lk.jsx)(L7.a, {
                                            onClick: Cf,
                                            size: 'small',
                                            color: 'success',
                                            variant: 'contained',
                                            children: 'Save',
                                          }),
                                        }),
                                      }),
                                    ],
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsxs)(La.a, {
                                      className: 'formControlClass',
                                      variant: 'standard',
                                      fullWidth: true,
                                      children: [
                                        Object(Lk.jsx)(LT.a, {
                                          id: 'demo-simple-select-label',
                                          children: 'Brand',
                                        }),
                                        Object(Lk.jsxs)(LC.a, {
                                          labelId: 'demo-simple-select-label',
                                          id: 'demo-simple-select',
                                          label: 'Brand',
                                          defaultValue: 'android',
                                          value: T6,
                                          onChange: function (Qx) {
                                            return T7(Qx.target.value)
                                          },
                                          children: [
                                            Object(Lk.jsx)(Lm.a, {
                                              value: 'ios',
                                              children: 'iOS',
                                            }),
                                            Object(Lk.jsx)(Lm.a, {
                                              value: 'android',
                                              children: 'Android',
                                            }),
                                          ],
                                        }),
                                      ],
                                    }),
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsx)('div', {
                                      className: 'input-wrapper',
                                      children: Object(Lk.jsx)(La.a, {
                                        fullWidth: true,
                                        sx: { width: '100%' },
                                        children: Object(Lk.jsx)(Lh.a, {
                                          sx: {
                                            '& .MuiInput-root': {
                                              color: 'white !important',
                                            },
                                            '& label.Mui-focused': {
                                              color: 'darkgray !important',
                                            },
                                            '& Mui-focused': {
                                              color: 'darkgray !important',
                                            },
                                            '& .MuiInput-underline:hover:not(.Mui-disabled):before':
                                              {
                                                borderColor:
                                                  'darkgray !important',
                                              },
                                            '& .MuiInput-underline:before': {
                                              borderColor:
                                                'darkgray !important',
                                              color: 'darkgray !important',
                                            },
                                            '& .MuiInput-underline:after': {
                                              borderColor: 'white !important',
                                              color: 'darkgray !important',
                                            },
                                            '& .Mui-focused:after': {
                                              color: 'darkgray !important',
                                            },
                                            '& .MuiInputAdornment-root': {
                                              color: 'darkgray !important',
                                            },
                                          },
                                          id: 'input-with-icon-textfield',
                                          label: 'Background URL (1:2.2 res)',
                                          variant: 'standard',
                                          value: TL,
                                          onChange: function (Qx) {
                                            return TF(Qx.target.value)
                                          },
                                          InputProps: {
                                            startAdornment: Object(Lk.jsx)(
                                              LF.a,
                                              {
                                                position: 'start',
                                                children: Object(Lk.jsx)('i', {
                                                  className:
                                                    'fas fa-images fa-w-20 fa-fw',
                                                }),
                                              }
                                            ),
                                          },
                                        }),
                                      }),
                                    }),
                                  }),
                                ],
                              }),
                              Object(Lk.jsx)('hr', {}),
                              Object(Lk.jsxs)('div', {
                                children: [
                                  Object(Lk.jsx)(L6.a, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'h6',
                                    gutterBottom: true,
                                    children: 'Notifications',
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsx)(L8.a, {
                                      className: 'jss255',
                                      children: Object(Lk.jsx)(L9.a, {
                                        control: Object(Lk.jsx)(LL.a, {
                                          color: 'warning',
                                          checked: Tm,
                                          onChange: function (Qx) {
                                            return Tk(Qx.target.checked)
                                          },
                                        }),
                                        label: 'Receive SMS',
                                      }),
                                    }),
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsx)(L8.a, {
                                      className: 'jss255',
                                      children: Object(Lk.jsx)(L9.a, {
                                        control: Object(Lk.jsx)(LL.a, {
                                          color: 'warning',
                                          checked: TH,
                                          onChange: function (Qx) {
                                            return TX(Qx.target.checked)
                                          },
                                        }),
                                        label: 'New Tweet',
                                      }),
                                    }),
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsx)(L8.a, {
                                      className: 'jss255',
                                      children: Object(Lk.jsx)(L9.a, {
                                        control: Object(Lk.jsx)(LL.a, {
                                          color: 'warning',
                                          checked: TQ,
                                          onChange: function (Qx) {
                                            return Tp(Qx.target.checked)
                                          },
                                        }),
                                        label: 'Receive Email',
                                      }),
                                    }),
                                  }),
                                ],
                              }),
                              Object(Lk.jsx)('hr', {}),
                              Object(Lk.jsxs)('div', {
                                children: [
                                  Object(Lk.jsx)(L6.a, {
                                    style: {
                                      color: '#fff',
                                      wordBreak: 'break-word',
                                    },
                                    variant: 'h6',
                                    gutterBottom: true,
                                    children: 'Images',
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'hud-row',
                                    children: Object(Lk.jsx)(L8.a, {
                                      className: 'jss255',
                                      children: Object(Lk.jsx)(L9.a, {
                                        control: Object(Lk.jsx)(LL.a, {
                                          color: 'warning',
                                          checked: TB,
                                          onChange: function (Qx) {
                                            return Tx(Qx.target.checked)
                                          },
                                        }),
                                        label: 'Embedded Images Enabled',
                                      }),
                                    }),
                                  }),
                                ],
                              }),
                            ],
                          }),
                        ],
                      }),
                    ],
                  }),
                }),
                Object(Lk.jsx)(L5.a, {
                  container: true,
                  className: LW.root,
                  children: Object(Lk.jsxs)('div', {
                    className: LW.hudOuterContainer,
                    style: { display: LV ? 'flex' : 'none' },
                    children: [
                      Object(Lk.jsxs)('div', {
                        className: LW.vehicleHudContainer,
                        style: { display: aV ? '' : 'none' },
                        children: [
                          Object(Lk.jsx)('div', {
                            className: 'waypointDistContainer',
                            style: { display: aZ ? '' : 'none' },
                            children: Object(Lk.jsxs)(L6.a, {
                              style: {
                                color: '#fff',
                                wordBreak: 'break-word',
                              },
                              variant: 'body1',
                              gutterBottom: true,
                              children: [ay, ' mi'],
                            }),
                          }),
                          Object(Lk.jsx)('div', {
                            className: LW.minimapBorder,
                            style: { display: !FY && FM && T2 ? '' : 'none' },
                          }),
                          Object(Lk.jsxs)('div', {
                            className: 'vehicleHud',
                            style: {
                              display: FM ? 'flex' : 'none',
                              left: FY ? 'calc(16.375vw)' : 'calc(14.375vw)',
                            },
                            children: [
                              Object(Lk.jsxs)('div', {
                                className: 'speedoMeterContainer',
                                children: [
                                  Object(Lk.jsx)('div', {
                                    className: 'speedoMeter',
                                    children: Object(Lk.jsxs)('div', {
                                      className: 'speedoMeterInner',
                                      children: [
                                        Object(Lk.jsx)('div', {
                                          className: 'speedoMeterSvg',
                                          children: Object(Lk.jsx)('svg', {
                                            version: '1.1',
                                            xmlns: 'http://www.w3.org/2000/svg',
                                            style: {
                                              height: '62px',
                                              width: '62px',
                                              transform: 'rotate(120deg)',
                                            },
                                            children: Object(Lk.jsx)('circle', {
                                              r: '27',
                                              cx: '31',
                                              cy: '31',
                                              fill: 'transparent',
                                              stroke: '#9E9E9E',
                                              'stroke-width': '6',
                                              'stroke-dasharray':
                                                '169.64600329384882',
                                              'stroke-dashoffset':
                                                '56.54866776461626',
                                            }),
                                          }),
                                        }),
                                        Object(Lk.jsx)('div', {
                                          className: 'speedoMeterSvg',
                                          children: Object(Lk.jsx)('svg', {
                                            version: '1.1',
                                            xmlns: 'http://www.w3.org/2000/svg',
                                            style: {
                                              height: '62px',
                                              width: '62px',
                                              transform: 'rotate(120deg)',
                                            },
                                            children: Object(Lk.jsx)('circle', {
                                              r: '27',
                                              cx: '31',
                                              cy: '31',
                                              fill: 'transparent',
                                              stroke: 'white',
                                              'stroke-width': '6',
                                              'stroke-dasharray': aE,
                                              'stroke-dashoffset': h0,
                                            }),
                                          }),
                                        }),
                                        Object(Lk.jsx)('div', {
                                          className: 'speedoMeterSpeed',
                                          style: { marginTop: '-6px' },
                                          children: Object(Lk.jsx)(L6.a, {
                                            style: {
                                              color: '#fff',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                            children: hf,
                                          }),
                                        }),
                                        Object(Lk.jsx)('div', {
                                          className: 'speedoMeterMph',
                                          style: { marginTop: '-12px' },
                                          children: Object(Lk.jsx)(L6.a, {
                                            style: {
                                              color: '#fff',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                            children: 'mph',
                                          }),
                                        }),
                                      ],
                                    }),
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'fuelPump',
                                    children: Object(Lk.jsxs)('div', {
                                      className: 'fuelPumpInner',
                                      children: [
                                        Object(Lk.jsx)('div', {
                                          className: 'fuelPumpSvg',
                                          children: Object(Lk.jsx)('svg', {
                                            style: {
                                              height: '32px',
                                              width: '32px',
                                              transform: 'rotate(150deg)',
                                            },
                                            children: Object(Lk.jsx)('circle', {
                                              r: '13.5',
                                              cx: '16',
                                              cy: '16',
                                              fill: 'transparent',
                                              stroke: '#9E9E9E',
                                              'stroke-width': '3',
                                              'stroke-dasharray':
                                                '84.82300164692441',
                                              'stroke-dashoffset':
                                                '28.27433388230813',
                                            }),
                                          }),
                                        }),
                                        Object(Lk.jsx)('div', {
                                          className: 'fuelPumpSvg',
                                          children: Object(Lk.jsx)('svg', {
                                            style: {
                                              height: '32px',
                                              width: '32px',
                                              transform: 'rotate(150deg)',
                                            },
                                            children: Object(Lk.jsx)('circle', {
                                              r: '13.5',
                                              cx: '16',
                                              cy: '16',
                                              fill: 'transparent',
                                              stroke: hT,
                                              'stroke-width': '3',
                                              'stroke-dasharray': h4,
                                              'stroke-dashoffset': h8,
                                            }),
                                          }),
                                        }),
                                        Object(Lk.jsx)('div', {
                                          className: 'fuelPumpIcon',
                                          style: { marginTop: '0px' },
                                          children: Object(Lk.jsx)('svg', {
                                            'aria-hidden': 'true',
                                            focusable: 'false',
                                            'data-prefix': 'fas',
                                            'data-icon': 'gas-pump',
                                            className:
                                              'svg-inline--fa fa-gas-pump fa-w-16 fa-fw fa-2x ',
                                            role: 'img',
                                            xmlns: 'http://www.w3.org/2000/svg',
                                            viewBox: '0 0 512 512',
                                            children: Object(Lk.jsx)('path', {
                                              fill: 'currentColor',
                                              d: 'M336 448H16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h320c8.8 0 16-7.2 16-16v-32c0-8.8-7.2-16-16-16zm157.2-340.7l-81-81c-6.2-6.2-16.4-6.2-22.6 0l-11.3 11.3c-6.2 6.2-6.2 16.4 0 22.6L416 97.9V160c0 28.1 20.9 51.3 48 55.2V376c0 13.2-10.8 24-24 24s-24-10.8-24-24v-32c0-48.6-39.4-88-88-88h-8V64c0-35.3-28.7-64-64-64H96C60.7 0 32 28.7 32 64v352h288V304h8c22.1 0 40 17.9 40 40v27.8c0 37.7 27 72 64.5 75.9 43 4.3 79.5-29.5 79.5-71.7V152.6c0-17-6.8-33.3-18.8-45.3zM256 192H96V64h160v128z',
                                            }),
                                          }),
                                        }),
                                        Object(Lk.jsx)('div', {
                                          className: 'fuelPumpAlt',
                                          style: { marginTop: '0px' },
                                          children: Object(Lk.jsx)(L6.a, {
                                            style: {
                                              color: '#fff',
                                              wordBreak: 'break-word',
                                            },
                                            variant: 'body2',
                                            gutterBottom: true,
                                          }),
                                        }),
                                      ],
                                    }),
                                  }),
                                ],
                              }),
                              Object(Lk.jsxs)('div', {
                                className: 'altContainer',
                                style: { display: aD ? '' : 'none' },
                                children: [
                                  Object(Lk.jsx)('div', {
                                    className: 'altSvg',
                                    children: Object(Lk.jsx)('svg', {
                                      version: '1.1',
                                      xmlns: 'http://www.w3.org/2000/svg',
                                      style: {
                                        height: '62px',
                                        width: '62px',
                                        transform: 'rotate(150deg)',
                                      },
                                      children: Object(Lk.jsx)('circle', {
                                        r: '27',
                                        cx: '31',
                                        cy: '31',
                                        fill: 'transparent',
                                        stroke: '#9E9E9E',
                                        'stroke-width': '6',
                                        'stroke-dasharray':
                                          '169.64600329384882',
                                        'stroke-dashoffset':
                                          '56.54866776461626',
                                      }),
                                    }),
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'altSvg',
                                    children: Object(Lk.jsx)('svg', {
                                      version: '1.1',
                                      xmlns: 'http://www.w3.org/2000/svg',
                                      style: {
                                        height: '62px',
                                        width: '62px',
                                        transform: 'rotate(150deg)',
                                      },
                                      children: Object(Lk.jsx)('circle', {
                                        r: '27',
                                        cx: '31',
                                        cy: '31',
                                        fill: 'transparent',
                                        stroke: 'white',
                                        'stroke-width': '6',
                                        'stroke-dasharray': hU,
                                        'stroke-dashoffset': hZ,
                                      }),
                                    }),
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'altSpeed',
                                    style: { marginTop: '-6px' },
                                    children: Object(Lk.jsx)(L6.a, {
                                      style: {
                                        color: '#fff',
                                        wordBreak: 'break-word',
                                      },
                                      variant: 'body2',
                                      gutterBottom: true,
                                      children: hG,
                                    }),
                                  }),
                                  Object(Lk.jsx)('div', {
                                    className: 'altAlt',
                                    style: { marginTop: '-12px' },
                                    children: Object(Lk.jsx)(L6.a, {
                                      style: {
                                        color: '#fff',
                                        wordBreak: 'break-word',
                                      },
                                      variant: 'body2',
                                      gutterBottom: true,
                                      children: 'alt',
                                    }),
                                  }),
                                ],
                              }),
                              Object(Lk.jsx)('div', {
                                className: 'seatBeltIcon',
                                style: { display: aN ? '' : 'none' },
                                children: Object(Lk.jsx)('svg', {
                                  'aria-hidden': 'true',
                                  focusable: 'false',
                                  'data-prefix': 'fas',
                                  'data-icon': 'user-slash',
                                  className:
                                    'svg-inline--fa fa-user-slash fa-w-20 fa-fw fa-lg ',
                                  role: 'img',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  viewBox: '0 0 640 512',
                                  style: { color: 'rgb(216, 67, 21)' },
                                  children: Object(Lk.jsx)('path', {
                                    fill: 'currentColor',
                                    d: 'M633.8 458.1L362.3 248.3C412.1 230.7 448 183.8 448 128 448 57.3 390.7 0 320 0c-67.1 0-121.5 51.8-126.9 117.4L45.5 3.4C38.5-2 28.5-.8 23 6.2L3.4 31.4c-5.4 7-4.2 17 2.8 22.4l588.4 454.7c7 5.4 17 4.2 22.5-2.8l19.6-25.3c5.4-6.8 4.1-16.9-2.9-22.3zM96 422.4V464c0 26.5 21.5 48 48 48h350.2L207.4 290.3C144.2 301.3 96 356 96 422.4z',
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: 'engineDamagedIcon',
                                style: { display: af ? '' : 'none' },
                                children: Object(Lk.jsx)('svg', {
                                  'aria-hidden': 'true',
                                  focusable: 'false',
                                  'data-prefix': 'fas',
                                  'data-icon': 'oil-can',
                                  className:
                                    'svg-inline--fa fa-oil-can fa-w-20 fa-fw fa-lg ',
                                  role: 'img',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  viewBox: '0 0 640 512',
                                  style: { color: 'rgb(216, 67, 21)' },
                                  children: Object(Lk.jsx)('path', {
                                    fill: 'currentColor',
                                    d: 'M629.8 160.31L416 224l-50.49-25.24a64.07 64.07 0 0 0-28.62-6.76H280v-48h56c8.84 0 16-7.16 16-16v-16c0-8.84-7.16-16-16-16H176c-8.84 0-16 7.16-16 16v16c0 8.84 7.16 16 16 16h56v48h-56L37.72 166.86a31.9 31.9 0 0 0-5.79-.53C14.67 166.33 0 180.36 0 198.34v94.95c0 15.46 11.06 28.72 26.28 31.48L96 337.46V384c0 17.67 14.33 32 32 32h274.63c8.55 0 16.75-3.42 22.76-9.51l212.26-214.75c1.5-1.5 2.34-3.54 2.34-5.66V168c.01-5.31-5.08-9.15-10.19-7.69zM96 288.67l-48-8.73v-62.43l48 8.73v62.43zm453.33 84.66c0 23.56 19.1 42.67 42.67 42.67s42.67-19.1 42.67-42.67S592 288 592 288s-42.67 61.77-42.67 85.33z',
                                  }),
                                }),
                              }),
                            ],
                          }),
                        ],
                      }),
                      Object(Lk.jsxs)('div', {
                        className: LW.hudInnerContainer,
                        style: { left: FY ? '0.4vw' : '0px' },
                        children: [
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: mL,
                              transition: 'all 1s linear 1s',
                              maxWidth: CG ? '54px' : '0px',
                              display: CG ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: m2
                                      ? 'rgb(213, 205, 49)'
                                      : m6
                                      ? '#C05D5D'
                                      : 'white',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: m2
                                      ? 'rgb(213, 205, 49)'
                                      : m6
                                      ? '#C05D5D'
                                      : 'white',
                                    'stroke-width': '6',
                                    'stroke-dasharray': mm,
                                    'stroke-dashoffset': mH,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsxs)('div', {
                                  className: LW.iconWrapper,
                                  children: [
                                    Object(Lk.jsx)('i', {
                                      className: 'fas '.concat(
                                        LD ? 'fa-headset' : 'fa-microphone',
                                        ' fa-w-11 fa-fw'
                                      ),
                                      style: {
                                        color:
                                          (LD &&
                                            void 0 !== Lf &&
                                            '' !== Lf &&
                                            Ly &&
                                            '1' !== TK) ||
                                          (LD &&
                                            void 0 !== Lf &&
                                            '' !== Lf &&
                                            '2' === TK)
                                            ? 'rgb(96, 96, 96)'
                                            : 'white',
                                        fontSize: '18px',
                                      },
                                    }),
                                    Object(Lk.jsx)('div', {
                                      className: LW.radioChannelWrapper,
                                      style: {
                                        display:
                                          (LD &&
                                            void 0 !== Lf &&
                                            '' !== Lf &&
                                            Ly &&
                                            '1' !== TK) ||
                                          (LD &&
                                            void 0 !== Lf &&
                                            '' !== Lf &&
                                            '2' === TK)
                                            ? ''
                                            : 'none',
                                      },
                                      children: Object(Lk.jsx)(L6.a, {
                                        style: {
                                          color: '#fff',
                                          fontSize: '11px',
                                        },
                                        variant: 'body1',
                                        gutterBottom: true,
                                        children: Lf,
                                      }),
                                    }),
                                  ],
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: mM,
                              transition: 'all 1s linear 1s',
                              maxWidth: mK ? '54px' : '0px',
                              display: mK ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: mP ? 'red' : '#3BB273',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': mP ? '1' : '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#3BB273',
                                    'stroke-width': '6',
                                    'stroke-dasharray': mY,
                                    'stroke-dashoffset': r2,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-heart fa-w-16 fa-fw',
                                    style: {
                                      color: 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: rF,
                              transition: 'all 1s linear 1s',
                              maxWidth: r8 ? '54px' : '0px',
                              display: r8 ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#33B8C1',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#33B8C1',
                                    'stroke-width': '6',
                                    'stroke-dasharray': rm,
                                    'stroke-dashoffset': rJ,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-burn fa-w-12 fa-fw',
                                    style: {
                                      color: 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: ry,
                              transition: 'all 1s linear 1s',
                              maxWidth: rf ? '54px' : '0px',
                              display: rf ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: rD ? 'red' : '#1565C0',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': rD ? '1' : '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#1565C0',
                                    'stroke-width': '6',
                                    'stroke-dasharray': rE,
                                    'stroke-dashoffset': k0,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className:
                                      'fas fa-shield-alt fa-w-16 fa-fw',
                                    style: {
                                      color: 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: kV,
                              transition: 'all 1s linear 1s',
                              maxWidth: kZ ? '54px' : '0px',
                              display: kZ ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: kU ? 'red' : '#FF6D00',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': kU ? '1' : '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FF6D00',
                                    'stroke-width': '6',
                                    'stroke-dasharray': kN,
                                    'stroke-dashoffset': kD,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-hamburger fa-w-16 fa-fw',
                                    style: {
                                      color: TY && !Fk ? '#FFD700' : 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: o8,
                              transition: 'all 1s linear 1s',
                              maxWidth: o4 ? '54px' : '0px',
                              display: o4 ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: o0 ? 'red' : '#0277BD',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': o0 ? '1' : '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#0277BD',
                                    'stroke-width': '6',
                                    'stroke-dasharray': oT,
                                    'stroke-dashoffset': oU,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-tint fa-w-11 fa-fw',
                                    style: {
                                      color: 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: oB,
                              transition: 'all 1s linear 1s',
                              maxWidth: oQ ? '54px' : '0px',
                              display: oQ ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#90A4AE',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#90A4AE',
                                    'stroke-width': '6',
                                    'stroke-dasharray': ou,
                                    'stroke-dashoffset': oP,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-lungs fa-w-20 fa-fw',
                                    style: {
                                      color: TM && !Fk ? '#FFD700' : 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: U0,
                              transition: 'all 1s linear 1s',
                              maxWidth: oE ? '54px' : '0px',
                              display: oE ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#d50000',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#d50000',
                                    'stroke-width': '6',
                                    'stroke-dasharray': U4,
                                    'stroke-dashoffset': U8,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-brain fa-w-18 fa-fw',
                                    style: {
                                      color: C2 && !Fk ? '#FFD700' : 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: Fk ? 0 : UX,
                              transition: 'all 1s linear 1s',
                              maxWidth: Uk && !Fk ? '54px' : '0px',
                              display: Uk && !Fk ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': Up,
                                    'stroke-dashoffset': Ux,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-lightbulb fa-w-14 fa-fw',
                                    style: {
                                      color: Uw && !Fk ? '#FFD700' : 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: Fk ? 0 : Uq,
                              transition: 'all 1s linear 1s',
                              maxWidth: UR && !Fk ? '54px' : '0px',
                              display: UR && !Fk ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': UO,
                                    'stroke-dashoffset': Uv,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-swimmer fa-w-16 fa-fw',
                                    style: {
                                      color: J2 && !Fk ? '#FFD700' : 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: Fk ? 0 : JT,
                              transition: 'all 1s linear 1s',
                              maxWidth: J8 && !Fk ? '54px' : '0px',
                              display: J8 && !Fk ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': JU,
                                    'stroke-dashoffset': JZ,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-dumbbell fa-w-6 fa-fw',
                                    style: {
                                      color: JV && !Fk ? '#FFD700' : 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: Fk ? 0 : JS,
                              transition: 'all 1s linear 1s',
                              maxWidth: Jw && !Fk ? '54px' : '0px',
                              display: Jw && !Fk ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': JA,
                                    'stroke-dashoffset': JG,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className:
                                      'fas fa-dollar-sign fa-w-11 fa-fw',
                                    style: {
                                      color: JY && !Fk ? '#FFD700' : 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: Fk ? 0 : H8,
                              transition: 'all 1s linear 1s',
                              maxWidth: H4 && !Fk ? '54px' : '0px',
                              display: H4 && !Fk ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': HT,
                                    'stroke-dashoffset': Hk,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-database fa-w-9 fa-fw',
                                    style: {
                                      color: HH && !Fk ? '#FFD700' : 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: Fk ? 0 : HN,
                              transition: 'all 1s linear 1s',
                              maxWidth: HV && !Fk ? '54px' : '0px',
                              display: HV && !Fk ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': HD,
                                    'stroke-dashoffset': HR,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className:
                                      'fas fa-exclamation fa-w-20 fa-fw',
                                    style: {
                                      color: Hq && !Fk ? '#FFD700' : 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: Fk ? 0 : X3,
                              transition: 'all 1s linear 1s',
                              maxWidth: Hv && !Fk ? '54px' : '0px',
                              display: Hv && !Fk ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': X7,
                                    'stroke-dashoffset': XL,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-wind fa-w-20 fa-fw',
                                    style: {
                                      color: XC && !Fk ? '#FFD700' : 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: Fk ? 0 : Xp,
                              transition: 'all 1s linear 1s',
                              maxWidth: XX && !Fk ? '54px' : '0px',
                              display: XX && !Fk ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#FFD700',
                                    'stroke-width': '6',
                                    'stroke-dasharray': Xx,
                                    'stroke-dashoffset': Xw,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-bicycle fa-w-20 fa-fw',
                                    style: {
                                      color: XS && !Fk ? '#FFD700' : 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: XO,
                              transition: 'all 1s linear 1s',
                              maxWidth: Xq ? '54px' : '0px',
                              display: Xq ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#AB47BC',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#AB47BC',
                                    'stroke-width': '6',
                                    'stroke-dasharray': Z0,
                                    'stroke-dashoffset': Z3,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className:
                                      'fas fa-user-slash fa-w-20 fa-fw',
                                    style: {
                                      color: 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: ZU,
                              transition: 'all 1s linear 1s',
                              maxWidth: Z8 && ZT ? '54px' : '0px',
                              display: Z8 && ZT ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#e43f5a',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#e43f5a',
                                    'stroke-width': '6',
                                    'stroke-dasharray': ZZ,
                                    'stroke-dashoffset': ZV,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className:
                                      'fas fa-tachometer-alt fa-w-18 fa-fw',
                                    style: {
                                      color: 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: Zz,
                              transition: 'all 1s linear 1s',
                              maxWidth: Zu ? '54px' : '0px',
                              display: Zu ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#47e10c',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#47e10c',
                                    'stroke-width': '6',
                                    'stroke-dasharray': Zf,
                                    'stroke-dashoffset': ZA,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-biohazard fa-w-18 fa-fw',
                                    style: {
                                      color: 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: ZY,
                              transition: 'all 1s linear 1s',
                              maxWidth: ZE ? '54px' : '0px',
                              display: ZE ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#f08329',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#f08329',
                                    'stroke-width': '6',
                                    'stroke-dasharray': W1,
                                    'stroke-dashoffset': W4,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className:
                                      'fas fa-location-arrow fa-w-16 fa-fw',
                                    style: {
                                      color: 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: WT,
                              transition: 'all 1s linear 1s',
                              maxWidth: W9 ? '54px' : '0px',
                              display: W9 ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#e43f5a',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#e43f5a',
                                    'stroke-width': '6',
                                    'stroke-dasharray': Wk,
                                    'stroke-dashoffset': WH,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-microchip fa-w-16 fa-fw',
                                    style: {
                                      color: 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: Wx,
                              transition: 'all 1s linear 1s',
                              maxWidth: Wp ? '54px' : '0px',
                              display: Wp ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#e43f5a',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#e43f5a',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-stream fa-w-16 fa-fw',
                                    style: {
                                      color: 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: Wy,
                              transition: 'all 1s linear 1s',
                              maxWidth: WR ? '54px' : '0px',
                              display: WR ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#e43f5a',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#e43f5a',
                                    'stroke-width': '6',
                                    'stroke-dasharray': WG,
                                    'stroke-dashoffset': WY,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-meteor fa-w-16 fa-fw',
                                    style: {
                                      color: 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: Q6,
                              transition: 'all 1s linear 1s',
                              maxWidth: Q3 ? '54px' : '0px',
                              display: Q3 ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#7788de',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: '#7788de',
                                    'stroke-width': '6',
                                    'stroke-dasharray': Q9,
                                    'stroke-dashoffset': QT,
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className:
                                      'fas fa-stopwatch-20 fa-w-16 fa-fw',
                                    style: {
                                      color: 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                          Object(Lk.jsxs)('div', {
                            className: LW.hudIconWrapper,
                            style: {
                              opacity: QW,
                              transition: 'all 1s linear 1s',
                              maxWidth: QJ ? '54px' : '0px',
                              display: QJ ? 'flex' : 'none',
                            },
                            children: [
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 100,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: FK ? '#b8b679' : '#000',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '0.35',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('svg', {
                                  version: '1.1',
                                  xmlns: 'http://www.w3.org/2000/svg',
                                  style: {
                                    height: '48px',
                                    width: '48px',
                                    transform: 'rotate(-90deg)',
                                    zIndex: 200,
                                  },
                                  children: Object(Lk.jsx)('circle', {
                                    r: '20',
                                    cx: '24',
                                    cy: '24',
                                    fill: 'transparent',
                                    stroke: FK ? '#b8b679' : '#000',
                                    'stroke-width': '6',
                                    'stroke-dasharray': '125.66370614359172',
                                    'stroke-dashoffset': '0',
                                    'stroke-opacity': '1',
                                    style: {
                                      transition:
                                        'stroke-dashoffset 400ms linear 0s',
                                      willChange: 'transition',
                                    },
                                  }),
                                }),
                              }),
                              Object(Lk.jsx)('div', {
                                className: LW.hudIcon,
                                children: Object(Lk.jsx)('div', {
                                  className: LW.iconWrapper,
                                  children: Object(Lk.jsx)('i', {
                                    className: 'fas fa-terminal fa-w-16 fa-fw',
                                    style: {
                                      color: 'white',
                                      fontSize: '18px',
                                    },
                                  }),
                                }),
                              }),
                            ],
                          }),
                        ],
                      }),
                    ],
                  }),
                }),
              ],
            }))
          )
        },
        LU = Object(R.a)({
          components: {
            MuiTypography: { styleOverrides: { root: { margin: '0' } } },
            MuiMenuItem: {
              styleOverrides: {
                root: {
                  backgroundColor: 'rgba(255, 255, 255, 0.02)',
                  '&.Mui-selected': {
                    backgroundColor: 'rgba(255, 255, 255, 0.3)',
                    '&.Mui-focusVisible': { background: 'rgba(0, 0, 0, 0.3)' },
                  },
                  '&.Mui-selected:hover': {
                    backgroundColor: 'rgba(255, 255, 255, 0.3)',
                  },
                },
              },
            },
            MuiCircularProgress: {
              styleOverrides: { circle: { strokeLinecap: 'butt' } },
            },
            MuiInput: {
              styleOverrides: {
                root: {
                  '& .MuiInput-root': {
                    color: 'darkgray !important',
                    fontSize: '1.3vmin !important',
                  },
                  '& label.Mui-focused': { color: 'darkgray !important' },
                  '& Mui-focused': { color: 'darkgray !important' },
                  '& .MuiInput-underline:hover:not(.Mui-disabled):before': {
                    borderColor: 'darkgray !important',
                  },
                  '& .MuiInput-underline:before': {
                    borderColor: 'darkgray !important',
                    color: 'darkgray !important',
                  },
                  '& .MuiInput-underline:after': {
                    borderColor: 'white !important',
                    color: 'darkgray !important',
                  },
                  '& .Mui-focused:after': {
                    color: 'darkgray !important',
                    fontSize: '1.5vmin !important',
                  },
                  '& .MuiInputAdornment-root': { color: 'darkgray !important' },
                },
              },
            },
            MuiTooltip: {
              styleOverrides: {
                tooltip: {
                  fontSize: '1em',
                  maxWidth: '1000px',
                },
              },
            },
          },
          palette: {
            mode: 'dark',
            primary: { main: '#95ef77' },
            secondary: { main: '#424cab' },
            success: { main: '#95ef77' },
            warning: { main: '#f2a365' },
            error: { main: '#ffffff' },
            info: { main: '#2d465b' },
          },
        }),
        LJ =
          (Object(A.a)(function (LZ) {
            return {
              root: {
                top: '0px',
                left: '0px',
                width: '100vw',
                height: '100vh',
                position: 'absolute',
                maxWidth: '100vw',
                minWidth: '100vw',
                maxHeight: '100vh',
                minHeight: '100vh',
                border: '0px',
                margin: '0px',
                outline: '0px',
                padding: '0px',
                overflow: 'hidden',
                '& .MuiInput-root': {
                  color: 'white',
                  fontSize: '1.3vmin',
                },
                '& .MuiInput-underline:hover:not(.Mui-disabled):before': {
                  borderColor: 'darkgray',
                },
                '& .MuiInput-underline:before': {
                  borderColor: 'darkgray',
                  color: 'darkgray',
                },
                '& .MuiInput-underline:after': {
                  borderColor: 'white',
                  color: 'darkgray',
                },
                '& .MuiInputLabel-animated': {
                  color: 'darkgray',
                  fontSize: '1.5vmin',
                },
                '& .MuiInputAdornment-root': { color: 'darkgray' },
                '& label.Mui-focused': { color: 'darkgray' },
              },
              input: {
                '& input[type=number]': { '-moz-appearance': 'textfield' },
                '& input[type=number]::-webkit-outer-spin-button': {
                  '-webkit-appearance': 'none',
                  margin: 0,
                },
                '& input[type=number]::-webkit-inner-spin-button': {
                  '-webkit-appearance': 'none',
                  margin: 0,
                },
              },
            }
          }),
          function () {
            return Object(Lk.jsx)(Lk.Fragment, {
              children: Object(Lk.jsx)(K.a, {
                theme: LU,
                children: Object(Lk.jsx)(Lo, {}),
              }),
            })
          }),
        LH = H(89),
        LX = (H(114), H(115), H(116), H(117), H(87))
      V.a.render(
        Object(Lk.jsx)(LH.a, {
          basename: '/',
          children: Object(Lk.jsx)(LX.a, { children: Object(Lk.jsx)(LJ, {}) }),
        }),
        document.getElementById('root')
      )
    },
  },
  [[120, 1, 2]],
])
