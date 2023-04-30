import pyautogui
import time
import pyperclip

pyautogui.PAUSE =3

pyautogui.press("winleft")
pyautogui.write("chrome")
pyautogui.PAUSE =2
pyautogui.hotkey("winleft", "up")
#pyautogui.prest('enter')
pyautogui.press("enter")
##link = "https://drive.google.com/drive/folders/0B1tpJqne4EOZZDl3ckJwT0IwLXM?resourcekey=0-941vshlEwt_X_M7Y9XAHlw"
pyautogui.write("mail.google.com")
pyautogui.press("enter")
pyperclip.copy(link)
pyautogui.sleep (5)
#botao de enviar email
pyautogui.click (81,167)
pyautogui.write ('leandro.moraes85@gmail.com')
pyautogui.press ('tab')
pyautogui.press ('tab')
assunto = "Relatório de Vendas de Ontem"
pyperclip.copy ( assunto)
pyautogui.hotkey ("ctrl", 'v')
pyautogui.press ('tab')
texto = f"""

*teste de bot*

Prezados, Bom dia

O faturamento de ontem foi de : {faturamento: ,.2f}

bot1 """

pyperclip.copy (texto)
pyautogui.hotkey ("ctrl", 'v')
pyautogui.hotkey ("ctrl", 'enter')
