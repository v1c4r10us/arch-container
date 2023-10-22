FROM archlinux/archlinux

RUN pacman -Syyu --noconfirm
RUN pacman -S xorg xorg-server xfce4 tigervnc git base-devel go net-tools --noconfirm

RUN useradd -m z3r0 \
    && usermod -aG wheel z3r0 \
    && chmod 600 /etc/sudoers \
    && echo '%wheel ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && echo ':1=z3r0' >> /etc/tigervnc/vncserver.users

USER z3r0
RUN cd /home/z3r0 && git clone https://aur.archlinux.org/yay-git.git \
    && cd /home/z3r0/yay-git && makepkg -si --noconfirm \
    && mkdir /home/z3r0/.vnc \
    && echo '1234abcd' | vncpasswd -f > /home/z3r0/.vnc/passwd \
    && chmod 600 /home/z3r0/.vnc/passwd
COPY config /home/z3r0/.vnc/config
RUN yay -S novnc --noconfirm
